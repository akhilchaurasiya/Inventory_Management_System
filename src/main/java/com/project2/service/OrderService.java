package com.project2.service;

import com.project2.model.Order;
import com.project2.model.Product;
import com.project2.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;

    // Modify placeOrder method to accept Product and quantity
    public Order placeOrder(Product product, int quantity) {
        Order order = new Order();
        order.setProduct(product);
        order.setQuantity(quantity);
        order.setOrderDate(new Date());
        return orderRepository.save(order);  // Save the order to the database
    }

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }
}
