package com.project.accounts.repository;

import com.project.accounts.domain.Bill;
import com.project.accounts.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface BillRepository extends JpaRepository<Bill, Long> {

    List<Bill> findAllByUser(User user);
}
