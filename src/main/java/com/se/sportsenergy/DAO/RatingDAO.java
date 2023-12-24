package com.se.sportsenergy.DAO;

import com.se.sportsenergy.model.Rating;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RatingDAO extends JpaRepository<Rating, Long> {

//    @Query("SELECT o FROM Rating o WHERE o.order.account.username AND o.product.name")
    @Query("SELECT o FROM Rating o WHERE o.product.id = ?1 ORDER BY o.createDate DESC")
    List<Rating> findByProductId(Long id);
}
