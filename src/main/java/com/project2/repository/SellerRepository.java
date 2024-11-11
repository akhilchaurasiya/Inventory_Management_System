package com.project2.repository;
import org.springframework.data.jpa.repository.JpaRepository;

import com.project2.model.Seller;

public interface SellerRepository extends JpaRepository<Seller, Long> {
}
