package com.se.sportsenergy.dto;
import com.se.sportsenergy.model.Order;
import com.se.sportsenergy.model.Product;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductStatisticDTO {
    private Product product;
    private Order order;
    private Long count;
    private Long totalQuantity;
}


