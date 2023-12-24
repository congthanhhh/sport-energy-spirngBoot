package com.se.sportsenergy.dto;

import com.se.sportsenergy.model.ProductAttribute;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductAttributeStatisticDTO {
    private ProductAttribute productAttribute;
    private Long totalQuantity;
    private Double revenue;
}


