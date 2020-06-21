package com.project.accounts.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/accounts")
public class MenuController {

    @GetMapping(value = "/menu")
    public String menu(){
        return "menu";
    }
}
