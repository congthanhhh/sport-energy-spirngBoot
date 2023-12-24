package com.se.sportsenergy.DAO;

import com.se.sportsenergy.model.Favorite;
import com.se.sportsenergy.model.Order;

import jakarta.transaction.Transactional;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FavoriteRepository extends JpaRepository<Favorite, Long> {

    List<Favorite> findByAccountUsername(String username);

    boolean existsByAccountUsernameAndProduct_Id(String username, Long productId);

    Long countByAccountUsername(String username);

    @Modifying
    @Transactional
    @Query("DELETE FROM Favorite f WHERE f.product.id = :productId")
    void deleteByProductId(@Param("productId") Long productId);

    List<Favorite> findByProduct_Id(Long productId);
}
