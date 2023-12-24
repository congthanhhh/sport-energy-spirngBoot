package com.se.sportsenergy.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "categories")
public class Category {
    @Id
    private String id;
    private String name;
    private String image;

    @JsonIgnore
    @OneToMany(mappedBy = "category")
    List<Product> product;
    @Column(columnDefinition = "BIT DEFAULT 1")
    private Boolean available;
}
