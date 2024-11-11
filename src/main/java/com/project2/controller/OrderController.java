package com.project2.controller;

import com.project2.model.Product;
import com.project2.service.OrderService;
import com.project2.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/orders")
public class OrderController {

    private final OrderService orderService;
    private final ProductService productService;

    // Place a new order with threshold check
    @PostMapping("/new/{productId}")
    public String placeOrder(@PathVariable Long productId, @RequestParam("quantity") int quantity, Model model) {
        Product product = productService.getProductById(productId);

        // Check if product quantity is below the threshold or zero
        if (product.getQuantity() < quantity || product.getQuantity() == 0) {
            model.addAttribute("errorMessage", "Product quantity is insufficient for the order.");
            return "redirect:/products";  // Redirect back to the product list
        }

        // Place the order if quantity is sufficient
        orderService.placeOrder(product, quantity);  // Save the order
        return "redirect:/orders";  // Redirect to the order summary page
    }

    // Display all orders
    @GetMapping
    public String getAllOrders(Model model) {
        model.addAttribute("orders", orderService.getAllOrders());
        return "order";  // Renders order.jsp
    }
}
