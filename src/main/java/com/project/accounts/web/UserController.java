package com.project.accounts.web;

import com.project.accounts.domain.Role;
import com.project.accounts.domain.User;
import com.project.accounts.repository.RoleRepository;
import com.project.accounts.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashSet;
import java.util.Set;

@Controller
public class UserController {

    private final UserService userService;
    private final RoleRepository roleRepository;

    public UserController(UserService userService, RoleRepository roleRepository) {
        this.userService = userService;
        this.roleRepository = roleRepository;
    }

    @GetMapping("/create-user")
    @ResponseBody
    public String createUser() {
        User user = new User();
        user.setUsername("admin2");
        user.setPassword("2");
        userService.saveUser(user);
        return "admin";
    }
}
