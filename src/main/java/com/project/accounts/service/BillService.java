package com.project.accounts.service;

import com.project.accounts.domain.Bill;
import com.project.accounts.domain.CategoryVat;
import com.project.accounts.domain.User;
import com.project.accounts.repository.BillRepository;
import com.project.accounts.repository.CategoryVatRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BillService {

    private final BillRepository billRepository;
    private final CategoryVatRepository categoryVatRepository;

    public BillService(BillRepository billRepository, CategoryVatRepository categoryVatRepository) {
        this.billRepository = billRepository;
        this.categoryVatRepository = categoryVatRepository;
    }

    public void saveBill(Bill bill) {
        billRepository.save(bill);
    }

    public Optional<Bill> findBillById(Long id) {
        return billRepository.findById(id);
    }

    public void deleteBill(Bill bill) {
        billRepository.delete(bill);
    }

    public List<Bill> findAllBillsByUser(User user) {
        return billRepository.findAllByUser(user);
    }

    public List<CategoryVat> categoryVatList() {
        return categoryVatRepository.findAll();
    }

    public double roundDouble(double amount) {
        amount *= 100;
        amount = Math.round(amount);
        amount /= 100;
        return amount;
    }
}
