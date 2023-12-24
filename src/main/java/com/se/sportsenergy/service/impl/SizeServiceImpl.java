package com.se.sportsenergy.service.impl;

import com.se.sportsenergy.DAO.SizeDAO;
import com.se.sportsenergy.model.Size;
import com.se.sportsenergy.service.SizeService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SizeServiceImpl implements SizeService {

    @Autowired
    SizeDAO sizeDAO;

    @Override
    public List<Size> findAll() {
        return sizeDAO.findAll();
    }

    @Override
    public Size findById(Long id) {
        return sizeDAO.findById(id).get();
    }

    @Override
    public Size create(Size size) {
        return sizeDAO.save(size);
    }

    @Override
    public Size update(Size size) {
        return sizeDAO.save(size);
    }

    @Override
    public void delete(Long id) {
        Optional<Size> size = sizeDAO.findById(id);
        if (size.isPresent()) {
            sizeDAO.deleteById(id);
        } else {
            throw new EntityNotFoundException("size not found with id: " + id);
        }
    }
}
