package com.se.sportsenergy.DAO;

import com.se.sportsenergy.model.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import com.se.sportsenergy.model.Order;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderDAO extends JpaRepository<Order,Long>{
    @Query("SELECT o FROM Order o WHERE o.account.username = :user")
    List<Order> findByUsername(@Param("user") String username);

    @Query("SELECT o FROM Order o WHERE o.orderStatus < 4")
    List<Order> findByOrderTrue();

    @Query("SELECT o.order.id FROM OrderDetail o WHERE o.order.account.username = :name AND o.product.id = :proId")
    List<Long> findOrderIdByUsernameAndProductId(@Param("name") String username, @Param("proId") Long proId);

}
