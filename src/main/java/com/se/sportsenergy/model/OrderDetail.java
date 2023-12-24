package com.se.sportsenergy.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "orderdetails")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "orderid", referencedColumnName = "id")
    @JsonIgnoreProperties(value = {"applications","hibernateLazyInitializer"})
    private Order order;


    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "productid", referencedColumnName = "id")
    @JsonIgnoreProperties(value = {"applications","hibernateLazyInitializer"})
    private Product product;

    private Double price;
    private Integer quantity;
    @Column(columnDefinition = "BIT DEFAULT 1")
    private Boolean available;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "productattributeid", referencedColumnName = "id")
    @JsonIgnoreProperties(value = {"applications","hibernateLazyInitializer"})
    private ProductAttribute productattribute;
}
