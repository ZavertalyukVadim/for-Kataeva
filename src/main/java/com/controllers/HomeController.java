package com.controllers;

import com.services.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/")
public class HomeController {

    private final ProjectService projectService;

    @Autowired
    public HomeController(ProjectService projectService) {
        this.projectService = projectService;
    }

    @GetMapping(value = "/")
    public String getHomePage() {
        if (projectService.getAllProjects().isEmpty()) {
            projectService.test();
        }
        return "home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    String login() {
        return "login";
    }
}
