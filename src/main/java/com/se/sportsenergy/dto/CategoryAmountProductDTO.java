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
public class CategoryAmountProductDTO{
    private Category category;
    private Long productCount;
}
