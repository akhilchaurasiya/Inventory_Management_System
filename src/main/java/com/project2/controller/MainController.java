package com.project2.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String home() {
        return "home";
    }
    
    @GetMapping("/home")
    public String viewhome() {
        return "home";
    }
}
