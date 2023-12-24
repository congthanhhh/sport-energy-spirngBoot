package com.se.sportsenergy.service;

import com.se.sportsenergy.model.Color;

import java.util.List;

public interface ColorService {

    List<Color> findAll();

    Color findById(Long id);

    Color create(Color color);

    Color update(Color color);

    void delete(Long id);
}
