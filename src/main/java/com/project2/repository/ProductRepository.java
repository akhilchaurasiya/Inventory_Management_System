package com.project2.repository;


import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import com.project2.model.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
	// Method to find products with quantity less than or equal to 5
    List<Product> findByQuantityLessThanEqual(int quantity);
}

