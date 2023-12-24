package com.se.sportsenergy.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.se.sportsenergy.dto.TopAccountDTO;
import com.se.sportsenergy.model.Order;

import java.time.LocalDate;
import java.util.Collection;
import java.util.List;

public interface OrderService {

    Order create(JsonNode orderData);

    List<Order> findAll();

    List<Order> findByOrderTrue();

    Order findById(Long id);

    List<Order> findByUsername(String username);

    void softDelete(Long id);

    void delete(Long id);

    Order updateStatus(Long id, Integer status);

}
