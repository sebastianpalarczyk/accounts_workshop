package com.project.accounts.web;

import com.project.accounts.domain.Bill;
import com.project.accounts.domain.User;
import com.project.accounts.repository.BillRepository;
import com.project.accounts.service.CurrentUser;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/accounts")
public class MenuController {

    private final BillRepository billRepository;

    public MenuController(BillRepository billRepository) {
        this.billRepository = billRepository;
    }

    @GetMapping(value = "/menu")
    public String getAll(Model model, @AuthenticationPrincipal CurrentUser customUser){
        User user = customUser.getUser();
        List<Bill> bills = billRepository.findAllByUser(user);
        model.addAttribute("bills", bills);
        return "menu";
    }
}
