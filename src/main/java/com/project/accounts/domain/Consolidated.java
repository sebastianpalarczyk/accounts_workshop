package com.project.accounts.domain;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "consolidateds")
public class Consolidated {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private double taxVat;
    private double taxPit;
    private LocalDate date;
    @Column(name = "created_date")
    private LocalDateTime created;
    @Column(name = "updated_date")
    private LocalDateTime updated;
    @ManyToOne
    private User user;

    @PrePersist
    public void prePersist() {
        created = LocalDateTime.now();
    }

    @PreUpdate
    public void preUpdate() {
        updated = LocalDateTime.now();
    }

    public Consolidated() {
    }

    public Consolidated(Long id, double taxVat, double taxPit, LocalDate date,
                        LocalDateTime created, LocalDateTime updated, User user) {
        this.id = id;
        this.taxVat = taxVat;
        this.taxPit = taxPit;
        this.date = date;
        this.created = created;
        this.updated = updated;
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getTaxVat() {
        return taxVat;
    }

    public void setTaxVat(double taxVat) {
        this.taxVat = taxVat;
    }

    public double getTaxPit() {
        return taxPit;
    }

    public void setTaxPit(double taxPit) {
        this.taxPit = taxPit;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Consolidated{" +
                "id=" + id +
                ", taxVat=" + taxVat +
                ", taxPit=" + taxPit +
                ", date=" + date +
                ", created=" + created +
                ", updated=" + updated +
                ", user=" + user +
                '}';
    }
}
