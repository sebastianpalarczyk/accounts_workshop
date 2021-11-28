package com.project.accounts.web;

import com.project.accounts.domain.Bill;
import com.project.accounts.domain.CategoryVat;
import com.project.accounts.domain.User;
import com.project.accounts.repository.BillRepository;
import com.project.accounts.repository.CategoryVatRepository;
import com.project.accounts.service.CurrentUser;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping(value = "/accounts/bill")
public class BillController {

    private final BillRepository billRepository;
    private final CategoryVatRepository categoryVatRepository;


    public BillController(BillRepository billRepository, CategoryVatRepository categoryVatRepository) {
        this.billRepository = billRepository;
        this.categoryVatRepository = categoryVatRepository;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getForm(Model model) {
        model.addAttribute("bill", new Bill());
        return "billForm";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String create(@ModelAttribute Bill bill, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDate date,     @AuthenticationPrincipal CurrentUser customUser){
        User user = customUser.getUser();
        bill.prePersist();
        double grossAmount = bill.getNetAmount()*1.23;
        bill.setGrossAmount(grossAmount);
        double vatAmount = grossAmount - bill.getNetAmount();
        bill.setVatAmount(vatAmount);
        bill.setUser(user);
        bill.setDate(date);
        billRepository.save(bill);
        return bill.toString();
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        Optional<Bill> bill = billRepository.findById(id);
        billRepository.delete(bill.get());;
        return "redirect:/accounts/bill/all";
    }

    @GetMapping("/all")
    public String getAll(Model model, @AuthenticationPrincipal CurrentUser customUser){
        User user = customUser.getUser();
        List<Bill> bills = billRepository.findAllByUser(user);
        model.addAttribute("bills", bills);
        return "bills";
    }

    @ModelAttribute("categories")
    public List<CategoryVat> categoryList(){
        return categoryVatRepository.findAll();
    }
}
