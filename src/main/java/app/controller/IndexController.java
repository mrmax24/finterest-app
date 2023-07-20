package app.controller;

import app.model.Account;
import app.model.User;
import app.service.AccountService;
import app.service.UserService;
import java.util.List;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
    private final AccountService accountService;
    private final UserService userService;

    public IndexController(AccountService accountService, UserService userService) {
        this.accountService = accountService;
        this.userService = userService;
    }

    @GetMapping("/")
    public String index(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        org.springframework.security.core.userdetails.User principal =
                (org.springframework.security.core.userdetails.User) auth.getPrincipal();
        String username = principal.getUsername();
        User user = userService.findByEmail(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found with"
                        + " username: " + username));

        List<Account> accounts = accountService.getAllByUser(user.getId());
        model.addAttribute("accounts", accounts);
        return "redirect:/dashboard";
    }
}
