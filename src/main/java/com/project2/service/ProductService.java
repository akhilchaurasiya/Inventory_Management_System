package com.project2.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project2.model.Product;
import com.project2.repository.ProductRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Product saveProduct(Product product) {
        return productRepository.save(product);
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }
    
    public List<Product> getLowStockProducts() {
        // Fetch products with quantity <= 5 from the repository
        return productRepository.findByQuantityLessThanEqual(5);
    }
}

