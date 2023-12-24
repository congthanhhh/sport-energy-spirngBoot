package com.se.sportsenergy.service;

import java.util.List;

import com.se.sportsenergy.model.Favorite;
import com.se.sportsenergy.model.Product;

public interface FavoriteService {
    void addToFavorites(Favorite favorite);

    List<Favorite> findFavoritesByUsername(String username);

    boolean isProductInFavorites(String username, Long productId);

    Long countFavoritesByUsername(String username);

    

    boolean removeFavoriteById(Long favoriteId);

}
