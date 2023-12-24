package com.se.sportsenergy.controller.admin;

import com.se.sportsenergy.dto.*;
import com.se.sportsenergy.model.OrderDetail;
import com.se.sportsenergy.model.Product;
import com.se.sportsenergy.service.CategoryService;
import com.se.sportsenergy.service.OrderDetailService;
import com.se.sportsenergy.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.*;

@Controller
@RequestMapping("/admin/")
public class StatisticController {

    @Autowired
    OrderDetailService orderDetailService;

    @Autowired
    ProductService productService;

    Calendar now = new GregorianCalendar();
    private final int currentYear = now.get(Calendar.YEAR);

    @GetMapping("/top-product-date")
    public String getTopProductByDate(@RequestParam(name = "dateOrder", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date,
                                      @RequestParam(name = "dateOrder2", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date2, Model model) {
        List<ProductStatisticDTO> topProduct;
        if (date != null || date2 != null) {
            topProduct = orderDetailService.getTopProductByDate2(date,date2);
            model.addAttribute("items", topProduct);
        } else {
            topProduct = orderDetailService.getTopProductByYear(currentYear);
            model.addAttribute("items", topProduct);
        }

        // Tính tổng
        double total = topProduct.stream().mapToDouble(item -> item.getProduct().getPrice() * item.getTotalQuantity()).sum();
        // Định dạng số
        NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
        String formattedTotal = numberFormat.format(total);
        model.addAttribute("total", formattedTotal);

        return "admin/statistic/topProduct";
    }

    @GetMapping("/top-account-date")
    public String getTopAccountByDate(@RequestParam(name = "month", defaultValue = "0") String month, Model model) {
        List<TopAccountDTO> topAccount;
        if (!month.equals("0")) {
            int year = Integer.parseInt(month.split("-")[0]);
            int monthNumber = Integer.parseInt(month.split("-")[1]);
            topAccount = orderDetailService.getTopAccountByYearAndMonth(year, monthNumber);
            model.addAttribute("items", topAccount);
        } else {
            topAccount = orderDetailService.getTopAccountByYear(currentYear);
            model.addAttribute("items", topAccount);
        }

        double total = topAccount.stream().mapToDouble(item -> item.getSumTotal()).sum();
        // Định dạng số
        NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
        String formattedTotal = numberFormat.format(total);
        model.addAttribute("total", formattedTotal);

        return "admin/statistic/topAccount";
    }

    @GetMapping("/top-account-product")
    public String getProductByAccount(Model model, @RequestParam("topAccount") String username) {
        List<OrderDetail> productByAccount = orderDetailService.findAllByOrderIdTrue(username);
        model.addAttribute("items", productByAccount);
        return "admin/statistic/productByAccount";
    }

    @GetMapping("/revenue-cate-date")
    public String revenueCateByDate(@RequestParam(name = "dateOrder", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date,
                                      @RequestParam(name = "dateOrder2", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date2, Model model) {
        List<RevenueCategoryDTO> revenueCategoryDTOS;
        if (date != null || date2 != null) {
            revenueCategoryDTOS = orderDetailService.getRevenueCateByDate(date,date2);
            model.addAttribute("items", revenueCategoryDTOS);
        } else {
            revenueCategoryDTOS = orderDetailService.getRevenueCateByYear(currentYear);
            model.addAttribute("items", revenueCategoryDTOS);
        }

//        // Tính tổng
        double total = revenueCategoryDTOS.stream().mapToDouble(item -> item.getSumCate()).sum();
        // Định dạng số
        NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
        String formattedTotal = numberFormat.format(total);
        model.addAttribute("total", formattedTotal);

        return "admin/statistic/revenueCate";
    }


    @GetMapping("/revenue-attribute")
    public String revenueAttribute(Model model, @RequestParam(name = "month", defaultValue = "0") String month) {
        List<ProductAttributeStatisticDTO> paStatistic;
        if (!month.equals("0")) {
            int year = Integer.parseInt(month.split("-")[0]);
            int monthNumber = Integer.parseInt(month.split("-")[1]);
            paStatistic = orderDetailService.getRevenueProductAttributeByYearAndMonth(year, monthNumber);
            model.addAttribute("items", paStatistic);
        } else {
            paStatistic = orderDetailService.getRevenueProductAttributeByYear(currentYear);
            model.addAttribute("items", paStatistic);
        }

        // Tính tổng
        double total = paStatistic.stream().mapToDouble(item -> item.getRevenue()).sum();
        // Định dạng số
        NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
        String formattedTotal = numberFormat.format(total);
        model.addAttribute("total", formattedTotal);

        return "admin/statistic/revenueAttribute";
    }

    @GetMapping("/statistic-category")
    public String statisticCategory(Model model) {
        List<CategoryAmountProductDTO> cateStatistic = productService.findAmountProductsOfCategory();
// số lượng sản phẩm của từng loại và hiển thị sp khi bấm vào loại
        //làm biểu đồ
        model.addAttribute("items", cateStatistic);
        return "admin/statistic/category";
    }

    @GetMapping("/statistic-category-product")
    public String statisticCategoryProduct(Model model, @RequestParam("category-id") String id) {
        List<Product> productByCategory = productService.findByCategoryId(id);
        model.addAttribute("items", productByCategory);
        return "admin/statistic/productByCategory";
    }


}
