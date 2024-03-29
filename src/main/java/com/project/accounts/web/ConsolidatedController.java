package com.project.accounts.web;

import com.project.accounts.domain.Bill;
import com.project.accounts.domain.User;
import com.project.accounts.repository.BillRepository;
import com.project.accounts.repository.ConsolidatedRepository;
import com.project.accounts.service.ConsolidatedService;
import com.project.accounts.service.CurrentUser;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping(value = "/accounts/consolidated")
public class ConsolidatedController {

    private final ConsolidatedRepository consolidatedRepository;
    private final BillRepository billRepository;
    private final ConsolidatedService consolidatedService;



    public ConsolidatedController(ConsolidatedRepository consolidatedRepository, BillRepository billRepository, ConsolidatedService consolidatedService) {
        this.consolidatedRepository = consolidatedRepository;
        this.billRepository = billRepository;
        this.consolidatedService = consolidatedService;
    }

    @GetMapping(value = "/create")
    public String create(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User user = customUser.getUser();
        List<Bill> allByUser = billRepository.findAllByUser(user);
        List<Bill> billList = consolidatedService.searchBills(allByUser);
        double resultVat = consolidatedService.resultVat(billList);
        double resultPit = consolidatedService.resultTaxPit(billList);
        model.addAttribute("resultVat", resultVat);
        model.addAttribute("resultPit", resultPit);
        return "consolidated";
    }

    @GetMapping(value = "/vatQuarters")
    public String createVat(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User user = customUser.getUser();
        List<Bill> allByUser = billRepository.findAllByUser(user);
        double vatFirstQuarter = consolidatedService.resultVatFirstQuarter(allByUser);
        double vatSecondQuarter = consolidatedService.resultVatSecondQuarter(allByUser);
        double vatThirdQuarter = consolidatedService.resultVatThirdQuarter(allByUser);
        double vatFourthQuarter = consolidatedService.resultVatFourthQuarter(allByUser);
        model.addAttribute("vatFirstQuarter", vatFirstQuarter);
        model.addAttribute("vatSecondQuarter", vatSecondQuarter);
        model.addAttribute("vatThirdQuarter", vatThirdQuarter);
        model.addAttribute("vatFourthQuarter", vatFourthQuarter);
        return "vat";
    }

    @GetMapping(value = "/taxQuarters")
    public String createPit(@AuthenticationPrincipal CurrentUser customUser, Model model){
        User user = customUser.getUser();
        List<Bill> allByUser = billRepository.findAllByUser(user);
        double taxFirstQuarter = consolidatedService.pitTaxFirstQuarter(allByUser);
        double taxSecondQuarter = consolidatedService.pitTaxSecondQuarter(allByUser);
        double taxThirdQuarter = consolidatedService.pitTaxThirdQuarter(allByUser);
        double taxFourthQuarter = consolidatedService.pitTaxFourthQuarter(allByUser);
        model.addAttribute("taxFirstQuarter", taxFirstQuarter);
        model.addAttribute("taxSecondQuarter", taxSecondQuarter);
        model.addAttribute("taxThirdQuarter", taxThirdQuarter);
        model.addAttribute("taxFourthQuarter", taxFourthQuarter);
        return "pit";
    }


}
