package com.project2.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project2.model.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {
}

