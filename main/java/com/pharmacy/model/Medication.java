package main.java.com.pharmacy.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;

public class Medication {
    private Long id;
    private String name;
    private String code;
    private String description;
    private String type;
    private String dosage;
    private BigDecimal price;
    private int stock;
    private int alertThreshold;
    private LocalDate expirationDate;
    private Long supplierId;

    // Constructeurs
    public Medication() {
    }

    public Medication(Long id, String name, String code, String description, String type, String dosage,
                      BigDecimal price, int stock, int alertThreshold, LocalDate expirationDate, Long supplierId) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.description = description;
        this.type = type;
        this.dosage = dosage;
        this.price = price;
        this.stock = stock;
        this.alertThreshold = alertThreshold;
        this.expirationDate = expirationDate;
        this.supplierId = supplierId;
    }

    // Getters & Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDosage() {
        return dosage;
    }

    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getAlertThreshold() {
        return alertThreshold;
    }

    public void setAlertThreshold(int alertThreshold) {
        this.alertThreshold = alertThreshold;
    }

    public LocalDate getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(LocalDate expirationDate) {
        this.expirationDate = expirationDate;
    }

    public Long getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Long supplierId) {
        this.supplierId = supplierId;
    }
}
