package com.se.sportsenergy.interceptor;

import com.se.sportsenergy.dto.ProductStatisticDTO;
import com.se.sportsenergy.dto.RevenueCategoryDTO;
import com.se.sportsenergy.service.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.text.NumberFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

@Component
public class GlobalInterceptor implements HandlerInterceptor {
    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductService productService;

    @Autowired
    AccountService accountService;

    @Autowired
    OrderService orderService;

    @Autowired
    OrderDetailService orderDetailService;

    @Autowired
    ProductAttributeService productAttributeService;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        request.setAttribute("cateInterceptor", categoryService.findAllTrue());

        //Các box thống kê của admin
        int acc = accountService.findAllByAvailableTrue().size();
        int order = orderService.findByOrderTrue().size();
        int proAtt = productAttributeService.findAllAvailableTrue().size();

        Calendar now = new GregorianCalendar();
        int currentYear = now.get(Calendar.YEAR);
        List<RevenueCategoryDTO> revenue = orderDetailService.getRevenueCateByYear(currentYear);
        // Tính tổng
        double total = revenue.stream().mapToDouble(item -> item.getSumCate()).sum();
        // Định dạng số
        NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
        String formattedTotal = numberFormat.format(total);

        request.setAttribute("accInterceptor", acc);
        request.setAttribute("orderInterceptor", order);
        request.setAttribute("proAttInterceptor", proAtt);
        request.setAttribute("revenueInterceptor", formattedTotal);
    }
}
