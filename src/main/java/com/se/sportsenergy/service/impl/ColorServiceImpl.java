package com.se.sportsenergy.service.impl;

import com.se.sportsenergy.DAO.ColorDAO;
import com.se.sportsenergy.model.Color;
import com.se.sportsenergy.service.ColorService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ColorServiceImpl implements ColorService {

    @Autowired
    ColorDAO colorDAO;

    @Override
    public List<Color> findAll() {
        return colorDAO.findAll();
    }

    @Override
    public Color findById(Long id) {
        return colorDAO.findById(id).get();
    }

    @Override
    public Color create(Color color) {
        return colorDAO.save(color);
    }

    @Override
    public Color update(Color color) {
        return colorDAO.save(color);
    }

    @Override
    public void delete(Long id) {
        Optional<Color> color = colorDAO.findById(id);
        if (color.isPresent()) {
            colorDAO.deleteById(id);
        } else {
            throw new EntityNotFoundException("Color not found with id: " + id);
        }
    }
}
