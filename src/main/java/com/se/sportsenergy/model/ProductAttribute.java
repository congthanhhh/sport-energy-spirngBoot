package com.se.sportsenergy.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity
@Table(name = "productattribute")
public class ProductAttribute {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "productid", referencedColumnName = "id")
    @JsonIgnoreProperties(value = {"applications","hibernateLazyInitializer"})
    private Product product;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "colorid", referencedColumnName = "id")
    @JsonIgnoreProperties(value = {"applications","hibernateLazyInitializer"})
    private Color colors;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "sizeid", referencedColumnName = "id")
    @JsonIgnoreProperties(value = {"applications","hibernateLazyInitializer"})
    private Size sizes;

    private Long stock;
    @Column(columnDefinition = "BIT DEFAULT 1")
    private Boolean available;

    @JsonIgnore
    @OneToMany(mappedBy = "productattribute", cascade = CascadeType.ALL)
    List<OrderDetail> orderDetails;
}
