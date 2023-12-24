package com.se.sportsenergy.service;


import com.se.sportsenergy.dto.*;
import com.se.sportsenergy.model.OrderDetail;

import java.time.LocalDate;
import java.util.List;

public interface OrderDetailService {
    List<OrderDetail> findByOrderId(Long id);

    List<OrderDetail> findAllByOrderIdTrue(String username);

    List<ProductStatisticDTO> getTopProduct();

    List<ProductStatisticDTO> getTopProductByYear(int year);

    List<ProductStatisticDTO2> getTopProductByYearAndMonth(int year, int month);

    List<ProductStatisticDTO> getTopProductByDate2(LocalDate date1, LocalDate date2);

    List<RevenueCategoryDTO> getRevenueCate();

    List<RevenueCategoryDTO> getRevenueCateByDate(LocalDate date1, LocalDate date2);

    List<RevenueCategoryDTO> getRevenueCateByMonth(int month);

    List<RevenueCategoryDTO> getRevenueCateByYearAndMonth(int year, int monthNumber);

    List<RevenueCategoryDTO> getRevenueCateByYear(int year);

    List<TopAccountDTO> getTopAccount();

    List<TopAccountDTO> getTopAccountByYear(int year);

    List<TopAccountDTO> getTopAccountByYearAndMonth(int year, int monthNumber);

    List<ProductAttributeStatisticDTO> getRevenueProductAttribute();

    List<ProductAttributeStatisticDTO> getRevenueProductAttributeByYear(int year);

    List<ProductAttributeStatisticDTO> getRevenueProductAttributeByYearAndMonth(int year, int monthNumber);
}
