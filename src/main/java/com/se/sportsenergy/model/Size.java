package com.se.sportsenergy.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity
@Table(name = "size")
public class Size {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;

    @JsonIgnore
    @OneToMany(mappedBy = "sizes")
    List<ProductAttribute> productAttributes;
    @Column(columnDefinition = "BIT DEFAULT 1")
    private Boolean available;
}
