package com.project.accounts.domain;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "bills")
public class Bill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate date;
    private String nameContractor;
    private String number;
    private double netAmount;
    private double grossAmount;
    private double vatAmount;
    @Column(name = "created_date")
    private LocalDateTime created;
    @Column(name = "updated_date")
    private LocalDateTime updated;
    @OneToOne
    @JoinColumn(name = "category_id")
    private CategoryVat category;
    @ManyToOne
    private User user;
    private String type;

    @PrePersist
    public void prePersist() {
        created = LocalDateTime.now();
    }

    @PreUpdate
    public void preUpdate() {
        updated = LocalDateTime.now();
    }

    public Bill() {
    }

    public Bill(Long id, LocalDate date, String nameContractor, String number,
                double netAmount, double grossAmount, double vatAmount, LocalDateTime created,
                LocalDateTime updated, CategoryVat category, User user, String type) {
        this.id = id;
        this.date = date;
        this.nameContractor = nameContractor;
        this.number = number;
        this.netAmount = netAmount;
        this.grossAmount = grossAmount;
        this.vatAmount = vatAmount;
        this.created = created;
        this.updated = updated;
        this.category = category;
        this.user = user;
        this.type = type;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getNameContractor() {
        return nameContractor;
    }

    public void setNameContractor(String nameContractor) {
        this.nameContractor = nameContractor;
    }

    public double getNetAmount() {
        return netAmount;
    }

    public void setNetAmount(double netAmount) {
        this.netAmount = netAmount;
    }

    public double getGrossAmount() {
        return grossAmount;
    }

    public void setGrossAmount(double grossAmount) {
        this.grossAmount = grossAmount;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    public LocalDateTime getUpdated() {
        return updated;
    }

    public void setUpdated(LocalDateTime updated) {
        this.updated = updated;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public CategoryVat getCategory() {
        return category;
    }

    public void setCategory(CategoryVat category) {
        this.category = category;
    }

    public double getVatAmount() {
        return vatAmount;
    }

    public void setVatAmount(double vatAmount) {
        this.vatAmount = vatAmount;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Bill{" +
                "id=" + id +
                ", date=" + date +
                ", nameContractor='" + nameContractor + '\'' +
                ", number='" + number + '\'' +
                ", netAmount=" + netAmount +
                ", grossAmount=" + grossAmount +
                ", vatAmount=" + vatAmount +
                ", created=" + created +
                ", updated=" + updated +
                ", category=" + category +
                ", user=" + user +
                ", type='" + type + '\'' +
                '}';
    }
}
