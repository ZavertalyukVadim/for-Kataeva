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
    public List<Stage> getAllStages(){
        return stageService.getAllStages();
    }

    @GetMapping(value = "/{id}")
    public Stage getStagesById(@PathVariable("id") Integer id){
        return stageService.getStageById(id);
    }

    @DeleteMapping(value = "/{id}")
    public boolean deleteStagesById(@PathVariable("id") Integer id){
        return stageService.deleteStageById(id);
    }

    @PutMapping(value = "/{id}")
    public Stage updateStages(@PathVariable("id") Integer id,@RequestBody Stage stage){
        return stageService.updateStage(id,stage);
    }

    @PostMapping
    public boolean addStages(@RequestBody Stage stage){
        return stageService.addStage(stage);
    }

    @PostMapping(value = "/{id}")
    public List<Stage> addListStages(@PathVariable("id") Integer id,@RequestBody List<Stage> stages){
        return stageService.addListStages(id,stages);
    }
}
