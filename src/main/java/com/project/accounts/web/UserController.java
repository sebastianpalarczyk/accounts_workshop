package com.project.accounts.web;

import com.project.accounts.domain.Bill;
import com.project.accounts.domain.Role;
import com.project.accounts.domain.User;
import com.project.accounts.repository.RoleRepository;
import com.project.accounts.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.Set;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    private final UserService userService;
    private final RoleRepository roleRepository;

    public UserController(UserService userService, RoleRepository roleRepository) {
        this.userService = userService;
        this.roleRepository = roleRepository;
    }

    @GetMapping("/add")
    public String getForm(Model model) {
        model.addAttribute("user", new User());
        return "userForm";
    }

    @PostMapping("/add")
    public String create(@ModelAttribute User user) {
        userService.saveUser(user);
        return "redirect:/login";
    }
}
