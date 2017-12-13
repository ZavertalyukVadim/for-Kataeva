package com.services;

import com.dao.ProjectDao;
import com.dao.StageDao;
import com.entities.Project;
import com.entities.Stage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StageService {
    private final StageDao stageDao;
    private final ProjectDao projectDao;

    @Autowired
    public StageService(StageDao stageDao, ProjectDao projectDao) {
        this.stageDao = stageDao;
        this.projectDao = projectDao;
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

    public boolean addListStages(Integer id, List<Stage> stages) {
        Project project = projectDao.findOne(id);
        if (project != null) {
            for (Stage stage : stages) {
                stage.setId(0);
                project.addStage(stage);
                stage.setProject(project);
            }
            projectDao.save(project);
            return true;
        }
        return false;
    }
}
