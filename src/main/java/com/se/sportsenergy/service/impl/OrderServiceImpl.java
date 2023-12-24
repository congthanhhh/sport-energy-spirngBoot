package com.se.sportsenergy.service.impl;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.se.sportsenergy.DAO.OrderDAO;
import com.se.sportsenergy.DAO.OrderDetailDAO;
import com.se.sportsenergy.dto.TopAccountDTO;
import com.se.sportsenergy.model.Order;
import com.se.sportsenergy.model.OrderDetail;
import com.se.sportsenergy.service.OrderService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderDAO orderRepository;

    @Autowired
    OrderDetailDAO orderDetailRepository;

    @Override
    public Order create(JsonNode orderData) {
        ObjectMapper mapper = new ObjectMapper();
        Order order = mapper.convertValue(orderData, Order.class);
        order.setAvailable(true);
        order.setOrderStatus(1);
        orderRepository.save(order);

        TypeReference<List<OrderDetail>> type = new TypeReference<List<OrderDetail>>() {};
        List<OrderDetail> details = mapper.convertValue(orderData.get("orderDetails"), type)
                .stream()
                .peek(d -> d.setOrder(order)).collect(Collectors.toList());
        orderDetailRepository.saveAll(details);

        return order;
    }

    @Override
    public List<Order> findAll() {
        return orderRepository.findAll();
    }

    @Override
    public List<Order> findByOrderTrue() {
        return orderRepository.findByOrderTrue();
    }

    @Override
    public Order findById(Long id) {
        return orderRepository.findById(id).get();
    }

    @Override
    public List<Order> findByUsername(String username) {
        return orderRepository.findByUsername(username);
    }

    @Override
    public void softDelete(Long id) {
        Optional<Order> orderOptional = orderRepository.findById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            order.setAvailable(false);
            order.setOrderStatus(4);
            orderRepository.save(order);
        } else {
            throw new EntityNotFoundException("Order not found with id: " + id);
        }
    }

    @Override
    public void delete(Long id) {
        Optional<Order> orderOptional = orderRepository.findById(id);
        if (orderOptional.isPresent()) {
            orderRepository.deleteById(id);
        } else {
            throw new EntityNotFoundException("Order not found with id: " + id);
        }
    }

    @Override
    public Order updateStatus(Long id, Integer status) {
        Optional<Order> orderOptional = orderRepository.findById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            order.setOrderStatus(status);
            orderRepository.save(order);
        } else {
            throw new EntityNotFoundException("Order not found with id: " + id);
        }
        return null;
    }
}
