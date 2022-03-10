package com.project.accounts.web;

import com.project.accounts.domain.Bill;
import com.project.accounts.domain.CategoryVat;
import com.project.accounts.domain.User;
import com.project.accounts.service.BillService;
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

    private final BillService billService;

    public BillController(BillService billService) {
        this.billService = billService;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getForm(Model model) {
        model.addAttribute("bill", new Bill());
        return "form";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String create(@ModelAttribute Bill bill, @AuthenticationPrincipal CurrentUser customUser) {
        User user = customUser.getUser();
        bill.prePersist();
        double grossAmount = bill.getNetAmount() * 1.23;
        bill.setGrossAmount(billService.roundDouble(grossAmount));
        double vatAmount = grossAmount - bill.getNetAmount();
        bill.setVatAmount(billService.roundDouble(vatAmount));
        bill.setUser(user);
        billService.saveBill(bill);
        return "redirect:/accounts/bill/add";
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable long id) {
        Optional<Bill> bill = billService.findBillById(id);
        billService.deleteBill(bill.get());
        return "redirect:/accounts/menu";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable Long id, Model model) {
        Optional<Bill> bill = billService.findBillById(id);
        model.addAttribute("billUpdate", bill.get());
        return "updateForm";
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    public String updateBill(@PathVariable Long id, @ModelAttribute Bill bill, @AuthenticationPrincipal CurrentUser customUser) {
        User user = customUser.getUser();
        Optional<Bill> updateBill = billService.findBillById(id);
        updateBill.get().preUpdate();
        double grossAmount = bill.getNetAmount() * 1.23;
        double vatAmount = grossAmount - bill.getNetAmount();
        updateBill.get().setNumber(bill.getNumber());
        updateBill.get().setNameContractor(bill.getNameContractor());
        updateBill.get().setDate(bill.getDate());
        updateBill.get().setNetAmount(bill.getNetAmount());
        updateBill.get().setVatAmount(billService.roundDouble(vatAmount));
        updateBill.get().setGrossAmount(billService.roundDouble(grossAmount));
        updateBill.get().setType(bill.getType());
        updateBill.get().setCategory(bill.getCategory());
        updateBill.get().setUser(user);
        billService.saveBill(updateBill.get());
        return "redirect:/accounts/menu";
    }


    @GetMapping("/all")
    public String getAll(Model model, @AuthenticationPrincipal CurrentUser customUser) {
        User user = customUser.getUser();
        List<Bill> bills = billService.findAllBillsByUser(user);
        model.addAttribute("bills", bills);
        return "bills";
    }

    @ModelAttribute("categories")
    public List<CategoryVat> categoryList() {
        return billService.categoryVatList();

    }
}
