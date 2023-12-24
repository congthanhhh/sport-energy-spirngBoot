package com.se.sportsenergy.service.impl;

import com.se.sportsenergy.DAO.OrderDetailDAO;
import com.se.sportsenergy.dto.*;
import com.se.sportsenergy.model.OrderDetail;
import com.se.sportsenergy.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

    @Autowired
    OrderDetailDAO orderDetailRepository;

    @Override
    public List<OrderDetail> findByOrderId(Long id) {
        return orderDetailRepository.findByOrderId(id);
    }

    @Override
    public List<OrderDetail> findAllByOrderIdTrue(String username) {
        return orderDetailRepository.findAllByOrderIdTrue(username);
    }

    @Override
    public List<ProductStatisticDTO> getTopProduct() {
        return orderDetailRepository.getTopProduct();
    }

    @Override
    public List<ProductStatisticDTO> getTopProductByYear(int year) {
        return orderDetailRepository.getTopProductByYear(year);
    }

    @Override
    public List<ProductStatisticDTO2> getTopProductByYearAndMonth(int year, int month) {
        return orderDetailRepository.getTopProductByYearAndMonth(year, month);
    }

    @Override
    public List<ProductStatisticDTO> getTopProductByDate2(LocalDate date1, LocalDate date2) {
        return orderDetailRepository.getTopProductByDate2(date1,date2);
    }

    @Override
    public List<RevenueCategoryDTO> getRevenueCate() {
        return orderDetailRepository.getRevenueCate();
    }

    @Override
    public List<RevenueCategoryDTO> getRevenueCateByDate(LocalDate date1, LocalDate date2) {
        return orderDetailRepository.getRevenueCateByDate(date1,date2);
    }

    @Override
    public List<RevenueCategoryDTO> getRevenueCateByMonth(int month) {
        return orderDetailRepository.getRevenueCateByMonth(month);
    }

    @Override
    public List<RevenueCategoryDTO> getRevenueCateByYearAndMonth(int year, int monthNumber) {
        return orderDetailRepository.getRevenueCateByYearAndMonth(year, monthNumber);
    }

    @Override
    public List<RevenueCategoryDTO> getRevenueCateByYear(int year) {
        return orderDetailRepository.getRevenueCateByYear(year);
    }

    @Override
    public List<TopAccountDTO> getTopAccount() {
        return orderDetailRepository.getTopAccount();
    }

    @Override
    public List<TopAccountDTO> getTopAccountByYear(int year) {
        return orderDetailRepository.getTopAccountByYear(year);
    }

    @Override
    public List<TopAccountDTO> getTopAccountByYearAndMonth(int year, int monthNumber) {
        return orderDetailRepository.getTopAccountByYearAndMonth(year, monthNumber);
    }

    @Override
    public List<ProductAttributeStatisticDTO> getRevenueProductAttribute() {
        return orderDetailRepository.getRevenueProductAttribute();
    }

    @Override
    public List<ProductAttributeStatisticDTO> getRevenueProductAttributeByYear(int year) {
        return orderDetailRepository.getRevenueProductAttributeByYear(year);
    }

    @Override
    public List<ProductAttributeStatisticDTO> getRevenueProductAttributeByYearAndMonth(int year, int monthNumber) {
        return orderDetailRepository.getRevenueProductAttributeByYearAndMonth(year, monthNumber);
    }

}
