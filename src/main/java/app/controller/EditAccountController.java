package app.controller;

import app.model.Account;
import app.model.Transaction;
import app.model.User;
import app.service.AccountService;
import app.service.TransactionService;
import app.service.session.SessionUserHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/accounts")
public class EditAccountController {
    private final SessionUserHolder sessionUserHolder;
    private final AccountService accountService;
    private final TransactionService transactionService;


    public EditAccountController(AccountService accountService,
                                 SessionUserHolder sessionUserHolder,
                                 TransactionService transactionService) {
        this.accountService = accountService;
        this.sessionUserHolder = sessionUserHolder;
        this.transactionService = transactionService;
    }

    @GetMapping
    public String getAccounts(Model model, HttpSession session) {
        Long userId = sessionUserHolder.getUserFromSession().getId();
        User userFromSession = sessionUserHolder.getUserFromSession();
        List<Account> accountsByUser = accountService.getAllByUser(userFromSession.getId());
        model.addAttribute("accounts", accountsByUser);
        BigDecimal totalBalance = accountService.getTotalBalance(userId);
        model.addAttribute("totalBalance", totalBalance);
        Object accountIsNegativeError = session.getAttribute("errorMessage");
        if (accountIsNegativeError != null) {
            model.addAttribute("accountIsNegativeError", accountIsNegativeError);
            session.removeAttribute("errorMessage");
        } else {
            model.addAttribute("accountIsNegativeError", "");
        }
        return "accounts";
    }

    @PostMapping
    public String addAccount(@RequestParam("name") String name,
                             @RequestParam("balance") BigDecimal balance, HttpSession session) {
        User userFromSession = sessionUserHolder.getUserFromSession();
        Account account = new Account(name, balance, userFromSession);
        try {
            accountService.add(account);
        } catch (RuntimeException e) {
            session.setAttribute("errorMessage", e.getMessage());
        }
        return "redirect:/accounts";
    }

    @PostMapping("/delete/{accountId}")
    public String deleteAccount(@PathVariable("accountId") Long accountId) {
        List<Transaction> transactions = transactionService.getByAccount(accountId);
        for (Transaction transaction : transactions) {
            transactionService.delete(transaction.getId());
        }
        accountService.delete(accountId);
        return "redirect:/accounts";
    }

    @PostMapping("/edit/{accountId}")
    public String editAccountBalance(@PathVariable("accountId") Long accountId,
                                     @RequestParam("nameToChange") String accountName,
                                     @RequestParam("amountToChange") BigDecimal amountToChange,
                                     HttpSession session) {
        Optional<Account> optionalAccount = accountService.get(accountId);
        try {
            if (optionalAccount.isPresent()) {
                Account account = optionalAccount.get();
                if (accountName == null || accountName.trim().isEmpty()) {
                    accountName = account.getName();
                }
                account.setBalance(amountToChange);
                account.setName(accountName);
                accountService.update(account);
            }
        } catch (RuntimeException e) {
            session.setAttribute("errorMessage", e.getMessage());
        }
        return "redirect:/accounts";
    }
}
