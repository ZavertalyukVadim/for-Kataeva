package com.services;

import com.dao.ProjectDao;
import com.dao.StageDao;
import com.entities.Project;
import com.entities.Stage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectService {

    private final ProjectDao projectDao;
    private final StageDao stageDao;

    @Autowired
    public ProjectService(ProjectDao projectDao, StageDao stageDao) {
        this.projectDao = projectDao;
        this.stageDao = stageDao;
    }

    public List<Project> getAllProjects() {
        return projectDao.findAll();
    }

    public boolean addProject(Project project) {
        Project save = projectDao.save(project);
        return save != null;
    }

    public Project updateProject(Integer id,Project project) {
        Project one = projectDao.findOne(id);
        one.setDescription(project.getDescription());
        one.setName(project.getName());
        return projectDao.save(one);
    }

    public boolean deleteProjectById(Integer id) {
        try {
            projectDao.delete(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public Project getProjectById(Integer id) {
        return projectDao.findOne(id);

    }

    public void test() {
        Project project = new Project("name","description");
        Stage stage = new Stage("name","description",10,5,2);
        stage.setProject(project);
        project.addStage(stage);
        projectDao.save(project);
    }
}
