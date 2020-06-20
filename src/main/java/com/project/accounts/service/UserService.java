package com.project.accounts.service;

import com.project.accounts.domain.User;

public interface UserService {

    User findByUserName(String name);
    void saveUser(User user);
}
