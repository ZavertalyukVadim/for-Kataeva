package com.controllers;

import com.entities.Project;
import com.services.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/api/project")
public class ProjectController {
    @Autowired
    private final ProjectService projectService;

    public ProjectController(ProjectService projectService) {
        this.projectService = projectService;
    }

    @GetMapping
    public List<Project> getAllProjects(){
        return projectService.getAllProjects();
    }

    @GetMapping(value = "/{id}")
    public Project getProjectById(@PathVariable("id") Integer id){
        return projectService.getProjectById(id);
    }

    @DeleteMapping(value = "/{id}")
    public boolean deleteProjectById(@PathVariable("id") Integer id){
        return projectService.deleteProjectById(id);
    }

    @PutMapping(value = "/{id}")
    public Project updateProject(@PathVariable("id") Integer id,@RequestBody Project project){
        return projectService.updateProject(id,project);
    }

    @PostMapping
    public boolean addProject(@RequestBody Project project){
        return projectService.addProject(project);
    }
}
