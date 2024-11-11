package com.project2.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project2.model.Category;


public interface CategoryRepository extends JpaRepository<Category, Long> {
}

