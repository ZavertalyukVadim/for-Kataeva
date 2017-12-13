package com.services;

import com.dao.StageDao;
import com.entities.Stage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StageService {
    private final StageDao stageDao;

    @Autowired
    public StageService(StageDao stageDao) {
        this.stageDao = stageDao;
    }

    public List<Stage> getAllStages() {
        return stageDao.findAll();
    }

    public boolean addStage(Stage stage) {
        Stage save = stageDao.save(stage);
        return save != null;
    }

    public Stage updateStage(Integer id, Stage stage) {
        Stage one = stageDao.findOne(id);
        one.setDescription(stage.getDescription());
        one.setName(stage.getName());
        one.setOptimisticAssessment(stage.getOptimisticAssessment());
        one.setProbableAssessment(stage.getProbableAssessment());
        one.setPessimisticAssessment(stage.getPessimisticAssessment());
        return stageDao.save(one);
    }

    public boolean deleteStageById(Integer id) {
        try {
            stageDao.delete(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public Stage getStageById(Integer id) {
        return stageDao.findOne(id);

    }
}
