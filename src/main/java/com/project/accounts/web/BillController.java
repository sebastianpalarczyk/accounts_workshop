package com.project.accounts.web;

import com.project.accounts.domain.Bill;
import com.project.accounts.domain.CategoryVat;
import com.project.accounts.domain.User;
import com.project.accounts.repository.BillRepository;
import com.project.accounts.repository.CategoryVatRepository;
import com.project.accounts.repository.UserRepository;
import com.project.accounts.service.CurrentUser;
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
    private final UserRepository userRepository;

    public BillController(BillRepository billRepository, CategoryVatRepository categoryVatRepository, UserRepository userRepository) {
        this.billRepository = billRepository;
        this.categoryVatRepository = categoryVatRepository;
        this.userRepository = userRepository;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getForm(Model model) {
        model.addAttribute("bill", new Bill());
        return "billForm";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String create(@ModelAttribute Bill bill){
        bill.prePersist();
        double grossAmount = bill.getNetAmount()*1.23;
        bill.setGrossAmount(grossAmount);
        double vatAmount = grossAmount - bill.getNetAmount();
        bill.setVatAmount(vatAmount);
        billRepository.save(bill);
        return "redirect:/bill/add";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        Optional<Bill> bill = billRepository.findById(id);
        billRepository.delete(bill.get());;
        return "redirect:/bill/all";
    }

    @GetMapping("/all")
    public String getAll(Model model){
        List<Bill> bills = billRepository.findAll();
        model.addAttribute("bills", bills);
        return "bills";
    }

    @ModelAttribute("categories")
    public List<CategoryVat> categoryList(){
        return categoryVatRepository.findAll();
    }
}
