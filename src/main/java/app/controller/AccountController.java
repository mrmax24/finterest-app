package app.controller;

import app.model.Account;
import app.model.Transaction;
import app.model.TransactionCategory;
import app.model.User;
import app.service.AccountService;
import app.service.TransactionCategoryService;
import app.service.session.SessionUserHolder;
import app.service.calculator.CurrencyConverter;
import app.service.TransactionService;
import app.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

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
        model.addAttribute("allTransactions", allTransactions);
        BigDecimal currentBalance = accountService.getTotalBalance(userFromSession.getId());
        model.addAttribute("currentBalance", currentBalance);
        List<TransactionCategory> allCategories = transactionCategoryService.getAll();
        model.addAttribute("allCategories", allCategories);
        Object errorMessageFromSession = session.getAttribute("errorMessage");
        if (errorMessageFromSession != null) {
            model.addAttribute("errorMessage", errorMessageFromSession);
            session.removeAttribute("errorMessage");
        } else {
            model.addAttribute("errorMessage", "");
        }
        return "dashboard";
    }


    @PostMapping
    public String addTransaction(@RequestParam("category") Long categoryId,
                                 @RequestParam("date") String date,
                                 @RequestParam("note") String note,
                                 @RequestParam("amount") BigDecimal amount,
                                 @RequestParam("currency") String currency,
                                 @RequestParam("account") Long accountId, HttpSession session) throws IOException {
        if (!currency.equals("UAH")) {
            amount = CurrencyConverter.convertToUAH(amount, currency);
        }
        Long id = accountService.getAll()
                .stream().filter(a -> a.getId().equals(accountId)).findAny().get().getId();
        Optional<Account> account = accountService.get(id);
        Account chosenAccount = account.orElseGet(Account::new);
        Optional<TransactionCategory> transactionCategoryOptional = transactionCategoryService.get(categoryId);
        TransactionCategory transactionCategory = transactionCategoryOptional.get();
        try {
            Transaction transaction = new Transaction(transactionCategory, date, note, amount, currency, chosenAccount);
            transactionService.add(transaction);
        } catch (RuntimeException e) {
            session.setAttribute("errorMessage", "Account " + chosenAccount.getName()
                    + " has insufficient funds");
        }
        return "redirect:/dashboard";
    }

    @PostMapping("/delete/{transactionId}")
    public String deleteTransaction(@PathVariable("transactionId") Long transactionId) {
        transactionService.deleteWithUpdate(transactionId);
        return "redirect:/dashboard";
    }

    @PostMapping("/edit/{transactionId}")
    public String editTransaction(@PathVariable("transactionId") Long transactionId,
                                  @RequestParam("account") Long accountId,
                                  @RequestParam("category") Long categoryId,
                                  @RequestParam("date") String date,
                                  @RequestParam("note") String note,
                                  @RequestParam("amount") BigDecimal amount,
                                  @RequestParam("currency") String currency, HttpSession session) throws IOException {

        if (!currency.equals("UAH")) {
            amount = CurrencyConverter.convertToUAH(amount, currency);
        }
        Optional<Account> optionalAccount = accountService.get(accountId);
        Optional<Transaction> optionalTransaction = transactionService.get(transactionId);
        Optional<TransactionCategory> transactionCategoryOptional = transactionCategoryService.get(categoryId);
        TransactionCategory transactionCategory = transactionCategoryOptional.get();

        if (optionalAccount.isPresent() && optionalTransaction.isPresent()) {
            Account account = optionalAccount.get();
            Transaction transaction = optionalTransaction.get();

            BigDecimal oldAmount = transaction.getAmount();
            BigDecimal newAmount = amount;

            // Розрахунок різниці між старою та новою сумою транзакції
            BigDecimal difference = newAmount.subtract(oldAmount);

            // Оновлення балансу рахунку
            BigDecimal currentBalance = account.getBalance();
            if (newAmount.compareTo(oldAmount) > 0) {
                BigDecimal balanceDifference = newAmount.subtract(oldAmount);
                currentBalance = currentBalance.subtract(balanceDifference);
            } else if (newAmount.compareTo(oldAmount) < 0) {
                BigDecimal balanceDifference = oldAmount.subtract(newAmount);
                currentBalance = currentBalance.add(balanceDifference);
            }
            account.setBalance(currentBalance);

            // Оновлення інших полів транзакції
            if (currentBalance.compareTo(BigDecimal.ZERO) >= 0) {
                transaction.setAccount(optionalAccount.get());
                transaction.setTransactionCategory(transactionCategory);
                transaction.setDate(date);
                transaction.setNote(note);
                transaction.setAmount(amount);
                transaction.setCurrency(currency);

                // Збереження оновлених даних
                accountService.update(account);
                transactionService.update(transaction);
            } else {
                session.setAttribute("errorMessage", "Account " + account.getName()
                        + " has insufficient funds");
            }
        }
        return "redirect:/dashboard";
    }
}


