package app.controller;

import app.model.Account;
import app.model.Transaction;
import app.model.User;
import app.service.AccountService;
import app.service.TransactionService;
import app.service.session.SessionUserHolder;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    public String getAccounts(Model model) {
        User userFromSession = sessionUserHolder.getUserFromSession();
        List<Account> accountsByUser = accountService.getAllByUser(userFromSession.getId());
        model.addAttribute("accounts", accountsByUser);
        return "accounts";
    }

    @PostMapping("/delete/{accountId}")
    public ResponseEntity<String> deleteAccount(@PathVariable("accountId") Long accountId) {
        List<Transaction> transactions = transactionService.getByAccount(accountId);
        for (Transaction transaction : transactions) {
            transactionService.delete(transaction.getId());
        }
        accountService.delete(accountId);
        return ResponseEntity.ok("Account deleted successfully");
    }

    @PostMapping("/edit/{accountId}")
    public ResponseEntity<String> editAccountBalance(@PathVariable("accountId") Long accountId,
                                               @RequestParam("amountToChange") BigDecimal amountToChange) {
        Optional<Account> optionalAccount = accountService.get(accountId);
        if (optionalAccount.isPresent()) {
            Account account = optionalAccount.get();
            BigDecimal balance = account.getBalance();
            account.setBalance(amountToChange);
            accountService.update(account);
            return ResponseEntity.ok("Account amount edited successfully");
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}

