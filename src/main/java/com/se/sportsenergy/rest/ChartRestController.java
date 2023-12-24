package com.se.sportsenergy.rest;

import com.se.sportsenergy.dto.CategoryAmountProductDTO;
import com.se.sportsenergy.dto.ProductStatisticDTO2;
import com.se.sportsenergy.dto.RevenueCategoryDTO;
import com.se.sportsenergy.dto.TopAccountDTO;
import com.se.sportsenergy.service.OrderDetailService;
import com.se.sportsenergy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
public class ChartRestController {

    @Autowired
    OrderDetailService orderDetailService;

    @Autowired
    ProductService productService;

    @GetMapping("/rest/chart-product")
    public List<ProductStatisticDTO2> chart2(@RequestParam(name = "month", defaultValue = "0") String month) {
        List<ProductStatisticDTO2> revenue;
        if (!month.equals("0")) {
            // Thực hiện chia mảng ở đây
            int year = Integer.parseInt(month.split("-")[0]);
            int monthNumber = Integer.parseInt(month.split("-")[1]);

            revenue = orderDetailService.getTopProductByYearAndMonth(year, monthNumber);
            return revenue;
        } else {
            // Trường hợp không chọn tháng, thực hiện truy vấn theo năm
            Calendar now = new GregorianCalendar();
            int currentYear = now.get(Calendar.YEAR);
            int currentMonth = now.get(Calendar.MONTH);
            return orderDetailService.getTopProductByYearAndMonth(currentYear, currentMonth);
        }
    }

    @GetMapping("/rest/chart-account")
    public List<TopAccountDTO> chartAccount(@RequestParam(name = "month", defaultValue = "0") String month) {
        List<TopAccountDTO> topAccount;
        if (!month.equals("0")) {
            // Thực hiện chia mảng ở đây
            int year = Integer.parseInt(month.split("-")[0]);
            int monthNumber = Integer.parseInt(month.split("-")[1]);

            topAccount = orderDetailService.getTopAccountByYearAndMonth(year, monthNumber);
            return topAccount;
        } else {
            // Trường hợp không chọn tháng, thực hiện truy vấn theo năm
            Calendar now = new GregorianCalendar();
            int currentYear = now.get(Calendar.YEAR);
            int currentMonth = now.get(Calendar.MONTH);
            return orderDetailService.getTopAccountByYearAndMonth(currentYear, currentMonth);
        }
    }

    @GetMapping("/rest/chart-category")
    public List<CategoryAmountProductDTO> chartAccount() {
        return productService.findAmountProductsOfCategory();
    }

    @GetMapping("/rest/chart-revenue")
    public List<List<RevenueCategoryDTO>> chart22(@RequestParam(name = "month", defaultValue = "0") String month) {
        if (!month.equals("0")) {
            int year = Integer.parseInt(month.split("-")[0]);
            int monthNumber = Integer.parseInt(month.split("-")[1]);

            List<RevenueCategoryDTO> dataByMonth = orderDetailService.getRevenueCateByYearAndMonth(year, monthNumber);
            List<RevenueCategoryDTO> dataByYear = orderDetailService.getRevenueCateByYear(year);

            // Trả về một danh sách chứa cả hai mảng dữ liệu
            return Arrays.asList(dataByMonth, dataByYear);
        } else {
            Calendar now = new GregorianCalendar();
            int currentYear = now.get(Calendar.YEAR);
            int currentMonth = now.get(Calendar.MONTH);

            List<RevenueCategoryDTO> dataByMonth = orderDetailService.getRevenueCateByYearAndMonth(currentYear, currentMonth);
            List<RevenueCategoryDTO> dataByYear = orderDetailService.getRevenueCateByYear(currentYear);

            // Trả về một danh sách chứa cả hai mảng dữ liệu
            return Arrays.asList(dataByMonth, dataByYear);
        }
    }

//    @GetMapping("/rest/chart")
//    public List<List<RevenueCategoryDTO>> chart22(@RequestParam(name = "month", defaultValue = "0") String month) {
//
//        if (StringUtils.isEmpty(month)) {
//            // Lấy tháng và năm hiện tại
//            LocalDate currentDate = LocalDate.now();
//            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");
//            month = currentDate.format(formatter);
//        }
//
//        int year = Integer.parseInt(month.split("-")[0]);
//        int monthNumber = Integer.parseInt(month.split("-")[1]);
//
//        List<RevenueCategoryDTO> dataByMonth = orderDetailService.getRevenueCateByYearAndMonth(year, monthNumber);
//        List<RevenueCategoryDTO> dataByYear = orderDetailService.getRevenueCateByYear(year);
//
//        return Arrays.asList(dataByMonth, dataByYear);
//    }


}
