package app.controller;

import app.model.Account;
import app.model.User;
import app.service.AccountService;
import app.service.session.SessionUserHolder;
import app.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;

@Controller
@RequestMapping("add-account")
public class CreateAccountController {
    private final AccountService accountService;
    private final UserService userService;
    private SessionUserHolder sessionUserHolder;

    public CreateAccountController(AccountService accountService,
                                   UserService userService, SessionUserHolder sessionUserHolder) {
        this.accountService = accountService;
        this.userService = userService;
        this.sessionUserHolder = sessionUserHolder;
    }

    @GetMapping
    public String getAccountForm(Model model, HttpSession session) {
        Object errorMessageFromSession = session.getAttribute("errorMessage");
        if (errorMessageFromSession != null) {
            model.addAttribute("accountIsNegativeError", errorMessageFromSession);
            session.removeAttribute("errorMessage");
        } else {
            model.addAttribute("accountIsNegativeError", "");
        }
        return "add-account";
    }

    @PostMapping
    public String addAccount(@RequestParam ("name") String name,
                             @RequestParam ("balance") BigDecimal balance, HttpSession session) {
        User userFromSession = sessionUserHolder.getUserFromSession();
        Account account = new Account(name, balance, userFromSession);
        try {
            accountService.add(account);
        } catch (RuntimeException e) {
            session.setAttribute("errorMessage", e.getMessage());
        }
        return "add-account";
    }
}
