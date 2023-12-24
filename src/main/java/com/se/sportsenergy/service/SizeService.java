package com.se.sportsenergy.service;


import com.se.sportsenergy.model.Size;

import java.util.List;

public interface SizeService {

    List<Size> findAll();

    Size findById(Long id);

    Size create(Size size);

    Size update(Size size);

    void delete(Long id);
}
