package com.controllers;

import com.services.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @Autowired
    private final ProjectService projectService;

    public HomeController(ProjectService projectService) {
        this.projectService = projectService;
    }

    @GetMapping(value = "/")
    public String getHomePage() {
        if (projectService.getAllProjects().isEmpty()){
            projectService.test();
        }
        return "home";
    }
}
