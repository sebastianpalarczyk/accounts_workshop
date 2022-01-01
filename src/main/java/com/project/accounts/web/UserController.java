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

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/add")
    public String getForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/add")
    public String create(@ModelAttribute User user) {
        userService.saveUser(user);
        return "redirect:/login";
    }
}
