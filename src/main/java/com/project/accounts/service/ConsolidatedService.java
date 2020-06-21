package com.project.accounts.service;

import com.project.accounts.domain.Bill;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ConsolidatedService {

    public double resultVat(List<Bill> bills){
        double sumVatRevenue = bills.stream()
                .filter(e->e.getType().equals("P"))
                .mapToDouble(Bill::getVatAmount).sum();
        double sumVatCost = bills.stream()
                .filter(e->e.getType().equals("K"))
                .mapToDouble(Bill::getVatAmount).sum();
        double result = sumVatRevenue - sumVatCost;
        return result;
    }

    public List<Bill> searchBills(List<Bill> billList){
        String month = LocalDate.now().getMonth().toString();
        int year = LocalDate.now().getYear();
        List<Bill> bills = billList.stream()
                .filter(e -> e.getDate().getMonth().toString().contains(month))
                .filter(e -> e.getDate().getYear() == year)
                .collect(Collectors.toList());
        return bills;
    }

    public double resultTaxPit(List<Bill> bills){
        double sumNetRevenue = bills.stream()
                .filter(e->e.getType().equals("P"))
                .mapToDouble(Bill::getNetAmount).sum();
        double sumNetCost = bills.stream()
                .filter(e->e.getType().equals("K"))
                .mapToDouble(Bill::getNetAmount).sum();
        double taxBase = sumNetRevenue - sumNetCost - 735.19;
        double taxPit = ((taxBase*18)/100 - 45.67);
        return roundDouble(taxPit);
    }

    public double roundDouble(double amount){
        amount *= 100;
        amount = Math.round(amount);
        amount /= 100;
        return amount;
    }


}
