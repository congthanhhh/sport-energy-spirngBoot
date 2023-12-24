package com.se.sportsenergy.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import java.sql.Timestamp;
import java.util.List;

@Data
@Entity
@Table(name = "Orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "username", referencedColumnName = "username")
    @JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})
    private Account account;

    @Column(name = "createdate")
    @CreationTimestamp
    private Timestamp createDate;

    private Integer phone;
    private String address;

    @Column(name = "paymentstatus")
    private Boolean paymentStatus;
    @Column(name = "orderstatus")
    private Integer orderStatus;

    @JsonIgnore
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    List<OrderDetail> orderDetails;
    @Column(columnDefinition = "BIT DEFAULT 1")
    private Boolean available;

    @JsonIgnore
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    List<Rating> ratings;
}
