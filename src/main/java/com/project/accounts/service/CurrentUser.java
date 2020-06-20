package com.project.accounts.service;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import java.util.Collection;

public class CurrentUser extends User {
    private final com.project.accounts.domain.User user;

    public CurrentUser(String username, String password,
                       Collection<? extends GrantedAuthority> authorities,
                       com.project.accounts.domain.User user) {
        super(username, password, authorities);
        this.user = user;
    }

    public com.project.accounts.domain.User getUser() {
        return user;
    }
}

