package com.project2.controller;


import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project2.model.Product;
import com.project2.service.CategoryService;
import com.project2.service.ProductService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/products")
public class ProductController {

    private final ProductService productService;
    private final CategoryService categoryService;

    @GetMapping
    public String getAllProducts(Model model) {
        List<Product> products = productService.getAllProducts();
        
        // Check for low stock products
        List<Product> lowStockProducts = products.stream()
                .filter(p -> p.getQuantity() < p.getThresholdQuantity())
                .collect(Collectors.toList());

        model.addAttribute("products", products);
        model.addAttribute("lowStockProducts", lowStockProducts);  // Send low stock products to the view
        return "product-list";
    }
    
    @GetMapping("/low-stock")
    public String viewLowStockProducts(Model model) {
        // Fetch products with quantity <= 5
        List<Product> lowStockProducts = productService.getLowStockProducts();
        
     // Log the size of the fetched list
        System.out.println("Low stock products count: " + lowStockProducts.size());

        
        // Add the low stock products to the model to pass it to the view
        model.addAttribute("lowStockProducts", lowStockProducts);
        
        // Forward to low-stock.jsp
        return "low-stock";
    }


    @GetMapping("/new")
    public String createProductForm(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("categories", categoryService.getAllCategories());  // Pass categories to view
        return "create-product";
    }


    @PostMapping
    public String saveProduct(@ModelAttribute("product") Product product) {
        productService.saveProduct(product);
        return "redirect:/products";
    }

    // Display the edit product form
    @GetMapping("/edit/{id}")
    public String editProductForm(@PathVariable Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("categories", categoryService.getAllCategories());
        return "edit-product";  // Renders edit-product.jsp
    }

    // Handle form submission for editing the product
    @PostMapping("/edit/{id}")
    public String updateProduct(@PathVariable Long id, @ModelAttribute("product") Product product) {
        Product existingProduct = productService.getProductById(id);
        existingProduct.setName(product.getName());
        existingProduct.setDescription(product.getDescription());
        existingProduct.setPrice(product.getPrice());
        existingProduct.setQuantity(product.getQuantity());
        existingProduct.setCategory(product.getCategory());
        productService.saveProduct(existingProduct);
        return "redirect:/products";  // Redirect back to the product list
    }

    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return "redirect:/products";
    }
}

