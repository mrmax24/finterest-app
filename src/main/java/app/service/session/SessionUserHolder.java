package app.service.session;

import app.model.User;
import app.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class SessionUserHolder {
    private UserService userService;

    public SessionUserHolder(UserService userService) {
        this.userService = userService;
    }
    public User getUserFromSession () {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        org.springframework.security.core.userdetails.User principal =
                (org.springframework.security.core.userdetails.User) auth.getPrincipal();
        String username = principal.getUsername();
        return userService.findByEmail(username)
                .orElseThrow(() -> new UsernameNotFoundException("User with username" +
                        " not found: " + username));
    }
}
