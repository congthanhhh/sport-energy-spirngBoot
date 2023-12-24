package com.se.sportsenergy.dto;

import com.se.sportsenergy.model.Order;
import com.se.sportsenergy.model.Product;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductStatisticDTO2 {
    private Product product;
    private Long count;
    private Long totalQuantity;
    private Double sumProduct;
}


