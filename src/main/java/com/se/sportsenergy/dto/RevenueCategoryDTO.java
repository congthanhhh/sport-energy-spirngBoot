package com.se.sportsenergy.dto;

import com.se.sportsenergy.model.Category;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RevenueCategoryDTO {
    private Category category;
    private Double sumCate;
    private Long countCate;
    private Long totalQuantity;
}
