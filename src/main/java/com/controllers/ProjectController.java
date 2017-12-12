package com.controllers;

import com.entities.Vendor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.services.VendorService;

import java.util.List;

@RestController
@RequestMapping(value = "/api/project")
public class ProjectController {
    private final VendorService vendorService;

    @Autowired
    public ProjectController(VendorService vendorService) {
        this.vendorService = vendorService;
    }

    @GetMapping(value = "/")
    public void test(){
    }

    @GetMapping(value = "/types")
    public List<Vendor> getAllTypes(){
        return vendorService.getAllVendors();
    }
}
