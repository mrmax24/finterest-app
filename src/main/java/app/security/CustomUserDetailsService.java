package app.security;

import app.model.User;
import app.service.UserService;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    private final UserService userService;
    private static final List<GrantedAuthority> authorities
            = Collections.singletonList(new SimpleGrantedAuthority("USER"));

    public CustomUserDetailsService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Optional<User> userOptional = userService.findByEmail(email);
        if (userOptional.isPresent()) {
            UserBuilder builder =
                    org.springframework.security.core.userdetails.User.withUsername(email);
            builder.password(userOptional.get().getPassword()).authorities(authorities);
            return builder.build();
        }
        throw new UsernameNotFoundException("User by email: " + email + " not found");
    }
}
