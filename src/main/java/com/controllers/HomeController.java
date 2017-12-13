package com.controllers;

import com.services.ProjectService;
import com.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/")
public class HomeController {

    private final ProjectService projectService;
    private final UserService userService;
    @Autowired
    public HomeController(ProjectService projectService, UserService userService) {
        this.projectService = projectService;
        this.userService = userService;

    }

    @GetMapping(value = "/")
    public String getHomePage() {
        if (projectService.getAllProjects().isEmpty()) {
            projectService.test();
        }
        return "home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }
    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String getPageRegistration() {
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@RequestParam("username")String username,@RequestParam("password")String password) {
        userService.addUser(username, password);
        return "home";
    }
}
