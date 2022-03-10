package com.project.accounts.service;

import com.project.accounts.domain.Bill;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ConsolidatedService {

    int year = LocalDate.now().getYear();

    public double resultVat(List<Bill> bills){
        double sumVatRevenue = searchGrossAmount(bills,"P");
        double sumVatCost = searchGrossAmount(bills,"K");
        double result = sumVatRevenue - sumVatCost;
        return roundDouble(result);
    }

    public List<Bill> searchBills(List<Bill> billList){
        String month = LocalDate.now().getMonth().toString();
        return billList.stream()
                .filter(e -> e.getDate().getMonth().toString().contains(month))
                .filter(e -> e.getDate().getYear() == year)
                .collect(Collectors.toList());
    }

    public double resultTaxPit(List<Bill> bills){
        double sumNetRevenue = searchNetAmount(bills,"P");
        double sumNetCost = searchNetAmount(bills,"K");
        double taxBase = sumNetRevenue - sumNetCost - 735.19;
        double taxPit = ((taxBase*18)/100 - 45.67);
        return roundDouble(taxPit);
    }

    public double resultVatFirstQuarter(List<Bill> bills){
        double sumVatRevenue = sumVatRevenueQuarter(bills,0,4);
        double sumVatCost = sumVatCostQuarter(bills,0,4);
        double result = sumVatRevenue - sumVatCost;
        return roundDouble(result);
    }

    public double resultVatSecondQuarter(List<Bill> bills){
        double sumVatRevenue = sumVatRevenueQuarter(bills,3,7);
        double sumVatCost = sumVatCostQuarter(bills,3,7);
        double result = sumVatRevenue - sumVatCost;
        return roundDouble(result);
    }

    public double resultVatThirdQuarter(List<Bill> bills){
        double sumVatRevenue = sumVatRevenueQuarter(bills,6,10);
        double sumVatCost = sumVatCostQuarter(bills,6,10);
        double result = sumVatRevenue - sumVatCost;
        return roundDouble(result);
    }

    public double resultVatFourthQuarter(List<Bill> bills){
        double sumVatRevenue = sumVatRevenueQuarter(bills,9,13);
        double sumVatCost = sumVatCostQuarter(bills,9,13);
        double result = sumVatRevenue - sumVatCost;
        return roundDouble(result);
    }

    public double searchNetAmount(List<Bill> bills, String parameter){
        return bills.stream()
                .filter(e->e.getType().equals(parameter))
                .mapToDouble(Bill::getNetAmount).sum();
    }

    public double searchGrossAmount(List<Bill> bills, String parameter){
        return bills.stream()
                .filter(e->e.getType().equals(parameter))
                .mapToDouble(Bill::getVatAmount).sum();
    }

    public double sumVatRevenueQuarter(List<Bill> bills, int a, int b) {
        return roundDouble(bills.stream()
                .filter(e -> e.getDate().getYear() == year)
                .filter(e -> e.getDate().getMonth().getValue() > a)
                .filter(e -> e.getDate().getMonth().getValue() < b)
                .filter(e -> e.getType().equals("P"))
                .mapToDouble(Bill::getVatAmount).sum());
    }

    public double sumVatCostQuarter(List<Bill> bills, int a, int b) {
        return roundDouble(bills.stream()
                .filter(e -> e.getDate().getYear() == year)
                .filter(e -> e.getDate().getMonth().getValue() > a)
                .filter(e -> e.getDate().getMonth().getValue() < b)
                .filter(e -> e.getType().equals("K"))
                .mapToDouble(Bill::getVatAmount).sum());
    }

    public double pitTaxFirstQuarter(List<Bill> bills){
        double sumNetRevenue = sumNetRevenue(bills,0,4);
        double sumNetCost = sumNetCost(bills,0,4);
        return pitTax(roundDouble(sumNetRevenue),roundDouble(sumNetCost));
    }

    public double pitTaxSecondQuarter(List<Bill> bills){
        double sumNetRevenue = sumNetRevenue(bills,3,7);
        double sumNetCost = sumNetCost(bills,3,7);
        return pitTax(roundDouble(sumNetRevenue),roundDouble(sumNetCost));
    }

    public double pitTaxThirdQuarter(List<Bill> bills){
        double sumNetRevenue = sumNetRevenue(bills,6,10);
        double sumNetCost = sumNetCost(bills,6,10);
        return pitTax(roundDouble(sumNetRevenue),roundDouble(sumNetCost));
    }

    public double pitTaxFourthQuarter(List<Bill> bills){
        double sumNetRevenue = sumNetRevenue(bills,9,13);
        double sumNetCost = sumNetCost(bills,9,13);
        return pitTax(roundDouble(sumNetRevenue),roundDouble(sumNetCost));
    }

    public double sumNetRevenue(List<Bill> bills, int a, int b){
        return roundDouble(bills.stream()
                .filter(e -> e.getDate().getYear() == year)
                .filter(e -> e.getDate().getMonth().getValue() > a)
                .filter(e -> e.getDate().getMonth().getValue() < b)
                .filter(e -> e.getType().equals("P"))
                .mapToDouble(Bill::getNetAmount).sum());
    }

    public double sumNetCost(List<Bill> bills, int a, int b){
        return roundDouble(bills.stream()
                .filter(e -> e.getDate().getYear() == year)
                .filter(e -> e.getDate().getMonth().getValue() > a)
                .filter(e -> e.getDate().getMonth().getValue() < b)
                .filter(e -> e.getType().equals("K"))
                .mapToDouble(Bill::getNetAmount).sum());
    }

    public double pitTax(double sumNetRevenue, double sumNetCost){
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
