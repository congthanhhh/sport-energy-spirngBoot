package com.se.sportsenergy.rest;

import com.se.sportsenergy.model.Rating;
import com.se.sportsenergy.service.RatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/rest/rating")
public class RatingRestController {

    @Autowired
    private RatingService ratingService;

    @GetMapping
    public ResponseEntity<List<Rating>> getAll() {
        List<Rating> ratingList = ratingService.findAll();
        if (ratingList.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(ratingList, HttpStatus.OK);
    }

    @GetMapping("/product/{id}")
    public ResponseEntity<List<Rating>> getAllByProductId(@PathVariable("id") Long id) {
        List<Rating> ratingList = ratingService.findByProductId(id);
        if (ratingList.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(ratingList, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Rating> getById(@PathVariable("id") Long id) {
        Rating rating = ratingService.findById(id);
        return new ResponseEntity<>(rating, HttpStatus.OK);
    }

    @GetMapping("/order/{username}/{proId}")
    public ResponseEntity<List<Long>> getOrderIdByUsernameAndProduct(@PathVariable("username") String username ,@PathVariable("proId") Long proId) {
        List<Long> orderDetail = ratingService.findByUsernameAndProductId(username, proId);
        return new ResponseEntity<>(orderDetail, HttpStatus.OK);
    }

    @PostMapping
    public Rating postRating(@RequestBody Rating rating) {
        return ratingService.create(rating);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Rating> putRating(@PathVariable("id") Long id, @RequestBody Rating rating) {
        Rating rating1 = ratingService.update(id, rating);
        if (rating1 == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(rating, HttpStatus.OK);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Rating> delete(@PathVariable("id") Long id) {
        Rating rating = ratingService.findById(id);
        if (rating == null) {
            return ResponseEntity.notFound().build();
        }
        ratingService.delete(rating);
        return ResponseEntity.ok().build();
    }
}
