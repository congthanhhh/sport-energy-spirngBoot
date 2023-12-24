package com.se.sportsenergy.service.impl;

import com.se.sportsenergy.DAO.OrderDAO;
import com.se.sportsenergy.DAO.RatingDAO;
import com.se.sportsenergy.model.OrderDetail;
import com.se.sportsenergy.model.Rating;
import com.se.sportsenergy.service.RatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RatingServiceImpl implements RatingService {

    @Autowired
    RatingDAO ratingRepository;

    @Autowired
    OrderDAO orderRepository;

    @Override
    public List<Rating> findAll() {
        return ratingRepository.findAll();
    }

    @Override
    public List<Rating> findByProductId(Long id) {
        return ratingRepository.findByProductId(id);
    }

    @Override
    public List<Long> findByUsernameAndProductId(String username, Long proId) {
        return orderRepository.findOrderIdByUsernameAndProductId(username, proId);
    }

    @Override
    public Rating findById(Long id) {
        Optional<Rating> rating = ratingRepository.findById(id);
        return rating.orElse(null);
    }

    @Override
    public Rating create(Rating rating) {
        return ratingRepository.save(rating);
    }

    @Override
    public Rating update(Long id, Rating rating) {
        return ratingRepository.findById(id)
                .map(rating2 -> {
                    rating2.setContent(rating.getContent());
                    rating2.setRating(rating.getRating());
                    rating2.setUsername(rating.getUsername());
                    rating2.setCreateDate(rating.getCreateDate());
                    rating2.setProduct(rating.getProduct());
                    rating2.setOrder(rating.getOrder());
                    return ratingRepository.save(rating2);
                }).orElse(null);
    }

    @Override
    public void delete(Rating rating) {
        ratingRepository.delete(rating);
    }
}
