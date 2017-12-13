package com.controllers;

import com.entities.Stage;
import com.services.StageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/api/stage")
public class StageController {
    @Autowired
    private final StageService stageService;

    public StageController(StageService stageService) {
        this.stageService = stageService;
    }

    @GetMapping
    public List<Stage> getAllProjects(){
        return stageService.getAllStages();
    }

    @GetMapping(value = "/{id}")
    public Stage getProjectById(@PathVariable("id") Integer id){
        return stageService.getStageById(id);
    }

    @DeleteMapping(value = "/{id}")
    public boolean deleteProjectById(@PathVariable("id") Integer id){
        return stageService.deleteStageById(id);
    }

    @PutMapping(value = "/{id}")
    public Stage updateProject(@PathVariable("id") Integer id,@RequestBody Stage stage){
        return stageService.updateStage(id,stage);
    }

    @PostMapping
    public boolean addProject(@RequestBody Stage stage){
        return stageService.addStage(stage);
    }
}
