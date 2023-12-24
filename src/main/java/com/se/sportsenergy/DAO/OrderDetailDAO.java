package com.se.sportsenergy.DAO;

import com.se.sportsenergy.dto.*;
import org.springframework.data.jpa.repository.JpaRepository;

import com.se.sportsenergy.model.OrderDetail;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface OrderDetailDAO extends JpaRepository<OrderDetail,Long>{
    @Query("SELECT p FROM OrderDetail p where p.order.id = ?1")
    List<OrderDetail> findByOrderId(Long id);

    @Query("SELECT o FROM OrderDetail o WHERE o.order.account.username = :username AND o.order.orderStatus = 3")
    List<OrderDetail> findAllByOrderIdTrue(@Param("username") String username);

    //top san pham mua nhieu
    @Query("SELECT new com.se.sportsenergy.dto.ProductStatisticDTO(o.product, o.order,COUNT(o.product.id), SUM(o.quantity)) FROM OrderDetail o " +
            "WHERE o.order.orderStatus = 3 GROUP BY o.product, o.order ORDER BY SUM(o.quantity)")
    List<ProductStatisticDTO> getTopProduct();

    @Query("SELECT new com.se.sportsenergy.dto.ProductStatisticDTO(o.product, o.order,COUNT(o.product.id), SUM(o.quantity)) FROM OrderDetail o " +
            "WHERE YEAR(o.order.createDate) = :year AND o.order.orderStatus = 3 GROUP BY o.product, o.order ORDER BY SUM(o.quantity)")
    List<ProductStatisticDTO> getTopProductByYear(@Param("year") int year);

    @Query("SELECT new com.se.sportsenergy.dto.ProductStatisticDTO2(o.product, COUNT(o.product.id), SUM(o.quantity), SUM(o.price * o.quantity)) FROM OrderDetail o " +
            "WHERE YEAR(o.order.createDate) = :year AND MONTH(o.order.createDate) = :month AND o.order.orderStatus = 3 GROUP BY o.product ORDER BY SUM(o.quantity)")
    List<ProductStatisticDTO2> getTopProductByYearAndMonth(@Param("year") int year, @Param("month") int month);

    @Query("SELECT new com.se.sportsenergy.dto.ProductStatisticDTO(o.product, o.order,COUNT(o.product.id), SUM(o.quantity)) FROM OrderDetail o " +
            "WHERE CAST(o.order.createDate as DATE) BETWEEN CAST(:date as DATE) AND CAST(:date2 as DATE) AND o.order.orderStatus = 3 GROUP BY o.product,o.order ORDER BY SUM(o.quantity)")
    List<ProductStatisticDTO> getTopProductByDate2(@Param("date") LocalDate date,
                                                   @Param("date2") LocalDate date2);

    //thong ke Product theo size va color
    @Query("SELECT new com.se.sportsenergy.dto.ProductAttributeStatisticDTO(o.productattribute, SUM(o.quantity), SUM(o.price * o.quantity)) " +
            "FROM OrderDetail o WHERE o.order.orderStatus = 3 GROUP BY o.productattribute")
    List<ProductAttributeStatisticDTO> getRevenueProductAttribute();

    @Query("SELECT new com.se.sportsenergy.dto.ProductAttributeStatisticDTO(o.productattribute, SUM(o.quantity), SUM(o.price * o.quantity)) " +
            "FROM OrderDetail o WHERE YEAR(o.order.createDate) = :year AND o.order.orderStatus = 3 GROUP BY o.productattribute")
    List<ProductAttributeStatisticDTO> getRevenueProductAttributeByYear(@Param("year") int year);

    @Query("SELECT new com.se.sportsenergy.dto.ProductAttributeStatisticDTO(o.productattribute, SUM(o.quantity), SUM(o.price * o.quantity)) " +
            "FROM OrderDetail o WHERE YEAR(o.order.createDate) = :year AND MONTH(o.order.createDate) = :month AND o.order.orderStatus = 3 " +
            "GROUP BY o.productattribute")
    List<ProductAttributeStatisticDTO> getRevenueProductAttributeByYearAndMonth(@Param("year") int year, @Param("month") int month);

    //Doanh thu theo category
    @Query("SELECT new com.se.sportsenergy.dto.RevenueCategoryDTO(o.product.category, SUM(o.product.price * o.quantity), COUNT(o.quantity), SUM(o.quantity)) " +
            "FROM OrderDetail o WHERE o.order.orderStatus = 3 GROUP BY o.product.category")
    List<RevenueCategoryDTO> getRevenueCate();

    @Query("SELECT new com.se.sportsenergy.dto.RevenueCategoryDTO(o.product.category, SUM(o.product.price * o.quantity), COUNT(o.quantity), SUM(o.quantity)) " +
            "FROM OrderDetail o WHERE CAST(o.order.createDate as DATE) BETWEEN CAST(:date as DATE) AND CAST(:date2 as DATE) AND o.order.orderStatus = 3 " +
            "GROUP BY o.product.category")
    List<RevenueCategoryDTO> getRevenueCateByDate(@Param("date") LocalDate date,
                                                  @Param("date2") LocalDate date2);


    @Query("SELECT new com.se.sportsenergy.dto.RevenueCategoryDTO(o.product.category, SUM(o.product.price * o.quantity), COUNT(o.quantity), SUM(o.quantity)) " +
            "FROM OrderDetail o WHERE MONTH(o.order.createDate) = :month AND o.order.orderStatus = 3 " +
            "GROUP BY o.product.category")
    List<RevenueCategoryDTO> getRevenueCateByMonth(@Param("month") int month);

    @Query("SELECT new com.se.sportsenergy.dto.RevenueCategoryDTO(o.product.category, SUM(o.product.price * o.quantity), COUNT(o.quantity), SUM(o.quantity)) " +
            "FROM OrderDetail o WHERE YEAR(o.order.createDate) = :year AND o.order.orderStatus = 3 " +
            "GROUP BY o.product.category ")
    List<RevenueCategoryDTO> getRevenueCateByYear(@Param("year") int year);

    @Query("SELECT new com.se.sportsenergy.dto.RevenueCategoryDTO(o.product.category, SUM(o.product.price * o.quantity), COUNT(o.quantity), SUM(o.quantity)) " +
            "FROM OrderDetail o WHERE YEAR(o.order.createDate) = :year AND MONTH(o.order.createDate) = :month AND o.order.orderStatus = 3 " +
            "GROUP BY o.product.category ")
    List<RevenueCategoryDTO> getRevenueCateByYearAndMonth(@Param("year") int year, @Param("month") int month);


    //top account
    @Query("SELECT new com.se.sportsenergy.dto.TopAccountDTO(o.order.account, COUNT(o.order.account.username), SUM(o.price * o.quantity)) " +
            "FROM OrderDetail o WHERE YEAR(o.order.createDate) = :year AND MONTH(o.order.createDate) = :month AND o.order.orderStatus = 3 GROUP BY o.order.account")
    List<TopAccountDTO> getTopAccountByYearAndMonth(@Param("year") int year, @Param("month") int month);

    @Query("SELECT new com.se.sportsenergy.dto.TopAccountDTO(o.order.account, COUNT(o.order.account.username), SUM(o.price * o.quantity)) " +
            "FROM OrderDetail o WHERE o.order.orderStatus = 3 GROUP BY o.order.account")
    List<TopAccountDTO> getTopAccount();

    @Query("SELECT new com.se.sportsenergy.dto.TopAccountDTO(o.order.account, COUNT(o.order.account.username), SUM(o.price * o.quantity)) " +
            "FROM OrderDetail o WHERE YEAR(o.order.createDate) = :year AND o.order.orderStatus = 3 GROUP BY o.order.account")
    List<TopAccountDTO> getTopAccountByYear(@Param("year") int year);

}
