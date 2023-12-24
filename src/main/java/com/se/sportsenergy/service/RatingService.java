package com.se.sportsenergy.service;

import com.se.sportsenergy.model.OrderDetail;
import com.se.sportsenergy.model.Rating;

import java.util.List;
import java.util.Optional;

public interface RatingService {
    List<Rating> findAll();

    List<Rating> findByProductId(Long id);

    List<Long> findByUsernameAndProductId(String username, Long proId);

    Rating findById(Long id);

    Rating create(Rating rating);

    Rating update(Long id, Rating rating);

    void delete(Rating rating);
}
