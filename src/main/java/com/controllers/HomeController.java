package com.controllers;

import com.services.ProjectService;
import com.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

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
    public String getHomePage(ModelMap modelMap) {
        if (projectService.getAllProjects().isEmpty()) {
            projectService.test();
        }
        Boolean role;
        Object auth = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        role = !Objects.equals(auth.toString(), "anonymousUser");
        modelMap.addAttribute("role", role);
        modelMap.addAttribute("projects", projectService.getAllProjects());
        return "home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap modelMap) {
        Boolean role;
        Object auth = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        role = !Objects.equals(auth.toString(), "anonymousUser");

        modelMap.addAttribute("role", role);
        return "login";
    }
    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String getPageRegistration(ModelMap modelMap) {
        Boolean role;
        Object auth = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        role = !Objects.equals(auth.toString(), "anonymousUser");

        modelMap.addAttribute("role", role);
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@RequestParam("username")String username,@RequestParam("password")String password) {
        userService.addUser(username, password);
        return "redirect:/";
    }

    @GetMapping(value = "/project/{id}")
    public String projectDetail(@PathVariable("id") Integer id,ModelMap modelMap){
        modelMap.addAttribute("project", projectService.getProjectById(id));
        return "project";
    }
}
