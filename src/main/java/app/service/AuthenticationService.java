package app.service;

import app.model.User;

public interface AuthenticationService {
    User register(String email, String login, String password);
}
