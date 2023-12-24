package com.se.sportsenergy.rest;

import com.fasterxml.jackson.databind.JsonNode;
import com.se.sportsenergy.model.Order;
import com.se.sportsenergy.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/rest/orders")
public class OrderRestController {

    @Autowired
    OrderService orderService;

    @GetMapping
    public List<Order> getAll() {
        return orderService.findAll();
    }

    @PostMapping()
    public Order create(@RequestBody JsonNode orderData) {
        return orderService.create(orderData);
    }

    @PutMapping("/{id}/{status}")
    public ResponseEntity<Order> updateStatus(@PathVariable Long id, @PathVariable Integer status) {
        Order updateStatus = orderService.updateStatus(id, status);
        if (updateStatus == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(updateStatus, HttpStatus.OK);
    }
    @DeleteMapping("/delete/{id}")
    public void deleteOrder(@PathVariable Long id) {
        orderService.delete(id);
    }
}
