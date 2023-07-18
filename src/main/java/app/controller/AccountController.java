package app.controller;

import app.model.Account;
import app.model.Transaction;
import app.model.TransactionCategory;
import app.model.User;
import app.service.AccountService;
import app.service.TransactionCategoryService;
import app.service.TransactionService;
import app.service.UserService;
import app.service.calculator.CurrencyConverter;
import app.service.session.SessionUserHolder;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/dashboard")
public class AccountController {
    private final TransactionService transactionService;
    private final AccountService accountService;
    private final UserService userService;
    private final SessionUserHolder sessionUserHolder;
    private final TransactionCategoryService transactionCategoryService;

    public AccountController(TransactionService transactionService,
                             AccountService accountService,
                             UserService userService,
                             TransactionCategoryService transactionCategoryService,
                             SessionUserHolder sessionUserHolder) {
        this.transactionService = transactionService;
        this.accountService = accountService;
        this.userService = userService;
        this.transactionCategoryService = transactionCategoryService;
        this.sessionUserHolder = sessionUserHolder;
    }

    @GetMapping
    public String getAccount(Model model, HttpSession session) {
        User userFromSession = sessionUserHolder.getUserFromSession();
        List<Account> accountsByUser = accountService.getAllByUser(userFromSession.getId());
        model.addAttribute("accounts", accountsByUser);
        List<Transaction> allTransactions = transactionService.getAll();
        List<Transaction> transactionsByUser = allTransactions.stream()
                .filter(t -> t.getAccount().getUser().getId()
                        .equals(userFromSession.getId()))
                .collect(java.util.stream.Collectors.toList());
        model.addAttribute("allTransactions", transactionsByUser);
        BigDecimal currentBalance = accountService.getTotalBalance(userFromSession.getId());
        model.addAttribute("currentBalance", currentBalance);
        List<TransactionCategory> allCategories = transactionCategoryService.getAll();
        model.addAttribute("allCategories", allCategories);

        Object nullAmountError = session.getAttribute("nullAmountErrorMessage");
        if (nullAmountError != null) {
            model.addAttribute("amountIsNullError", nullAmountError);
            session.removeAttribute("nullAmountErrorMessage");
        } else {
            model.addAttribute("amountIsNullError", "");
        }

        Object invalidAmountError = session.getAttribute("invalidAmountErrorMessage");
        if (invalidAmountError != null) {
            model.addAttribute("amountIsNotValidError", invalidAmountError);
            session.removeAttribute("invalidAmountErrorMessage");
        } else {
            model.addAttribute("amountIsNotValidError", "");
        }

        Object insufficientAmountError = session.getAttribute("insufficientAmountErrorMessage");
        if (insufficientAmountError != null) {
            model.addAttribute("insufficientAmountError", insufficientAmountError);
            session.removeAttribute("insufficientAmountErrorMessage");
        } else {
            model.addAttribute("insufficientAmountError", "");
        }

        Object accountIsNegativeError = session.getAttribute("errorMessageFromAccount");
        if (accountIsNegativeError != null) {
            model.addAttribute("accountIsNegativeError", accountIsNegativeError);
            session.removeAttribute("errorMessageFromAccount");
        } else {
            model.addAttribute("accountIsNegativeError", "");
        }
        return "dashboard";
    }

    @PostMapping("/add-account")
    public String addAccountFromDashboard(@RequestParam("account_name") String name,
                                          @RequestParam("account_balance") BigDecimal balance,
                                          HttpSession session) {
        User userFromSession = sessionUserHolder.getUserFromSession();
        Account account = new Account(name, balance, userFromSession);
        try {
            accountService.add(account);
        } catch (RuntimeException e) {
            session.setAttribute("errorMessageFromAccount", e.getMessage());
        }
        return "redirect:/dashboard";
    }

    @PostMapping
    public String addTransaction(@RequestParam("category") Long categoryId,
                                 @RequestParam("date") String date,
                                 @RequestParam("note") String note,
                                 @RequestParam(value = "amount",
                                         required = false) BigDecimal amount,
                                 @RequestParam("currency") String currency,
                                 @RequestParam("account") Long accountId, HttpSession session)
            throws IOException {
        if (!currency.equals("UAH")) {
            amount = CurrencyConverter.convertToUah(amount, currency);
        }
        Long id = accountService.getAll()
                .stream().filter(a -> a.getId().equals(accountId)).findAny().get().getId();
        Optional<Account> account = accountService.get(id);
        Account chosenAccount = account.orElseGet(Account::new);
        Optional<TransactionCategory> transactionCategoryOptional
                = transactionCategoryService.get(categoryId);
        TransactionCategory transactionCategory = transactionCategoryOptional.get();
        if (amount == null) {
            session.setAttribute("nullAmountErrorMessage",
                    "Field 'amount' cannot be empty");
        } else if (amount.compareTo(BigDecimal.ZERO) < 0) {
            session.setAttribute("invalidAmountErrorMessage",
                    "Amount must be greater than or equal to zero");
        } else if (chosenAccount.getBalance().compareTo(amount) < 0) {
            session.setAttribute("insufficientAmountErrorMessage",
                    "Account " + "'" + chosenAccount.getName()
                    + "'" + " has insufficient funds");
        } else {
            Transaction transaction = new Transaction(transactionCategory,
                    date, note, amount, currency, chosenAccount);
            transactionService.add(transaction);
        }
        return "redirect:/dashboard";
    }

    @PostMapping("/delete/{transactionId}")
    public String deleteTransaction(@PathVariable("transactionId")
                                                Long transactionId) {
        transactionService.deleteWithUpdate(transactionId);
        return "redirect:/dashboard";
    }

    @PostMapping("/edit/{transactionId}")
    public String editTransaction(@PathVariable("transactionId") Long transactionId,
                                  @RequestParam("account") Long accountId,
                                  @RequestParam("category") Long categoryId,
                                  @RequestParam("date") String date,
                                  @RequestParam("note") String note,
                                  @RequestParam(value = "amount",
                                          required = false) BigDecimal amount,
                                  @RequestParam("currency") String currency,
                                  HttpSession session) throws IOException {

        if (!currency.equals("UAH")) {
            amount = CurrencyConverter.convertToUah(amount, currency);
        }
        Optional<Account> optionalAccount = accountService.get(accountId);
        Optional<Transaction> optionalTransaction = transactionService.get(transactionId);
        Optional<TransactionCategory> transactionCategoryOptional =
                transactionCategoryService.get(categoryId);

        if (optionalAccount.isPresent() && optionalTransaction.isPresent()
                && transactionCategoryOptional.isPresent()) {
            Account account = optionalAccount.get();
            Transaction transaction = optionalTransaction.get();
            TransactionCategory transactionCategory = transactionCategoryOptional.get();

            BigDecimal oldAmount = transaction.getAmount();
            BigDecimal newAmount = amount;

            BigDecimal currentBalance = account.getBalance();
            if (newAmount != null && oldAmount != null) {
                if (newAmount.compareTo(oldAmount) > 0) {
                    BigDecimal balanceDifference = newAmount.subtract(oldAmount);
                    currentBalance = currentBalance.subtract(balanceDifference);
                } else if (newAmount.compareTo(oldAmount) < 0) {
                    BigDecimal balanceDifference = oldAmount.subtract(newAmount);
                    currentBalance = currentBalance.add(balanceDifference);
                }
            }
            if (amount == null) {
                session.setAttribute("nullAmountErrorMessage",
                        "Field 'amount' cannot be empty");
            } else if (amount.compareTo(BigDecimal.ZERO) < 0) {
                session.setAttribute("invalidAmountErrorMessage",
                        "Amount must be greater than or equal to zero");
            } else if (currentBalance.compareTo(BigDecimal.ZERO) <= 0) {
                session.setAttribute("insufficientAmountErrorMessage",
                        "Account " + "'" + account.getName()
                        + "'" + " has insufficient funds");
            } else {
                account.setBalance(currentBalance);
                transaction.setAccount(account);
                transaction.setTransactionCategory(transactionCategory);
                transaction.setDate(date);
                transaction.setNote(note);
                transaction.setAmount(amount);
                transaction.setCurrency(currency);
                accountService.update(account);
                transactionService.update(transaction);
            }
        }
        return "redirect:/dashboard";
    }
}
