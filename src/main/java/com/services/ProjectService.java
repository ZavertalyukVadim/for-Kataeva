package com.services;

import com.dao.ProjectDao;
import com.entities.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectService {

    private final ProjectDao projectDao;

    @Autowired
    public ProjectService(ProjectDao projectDao) {
        this.projectDao = projectDao;
    }

    public List<Project> getAllProjects() {
        return projectDao.findAll();
    }

    public boolean addProject(Project project) {
        Project save = projectDao.save(project);
        return save != null;
    }
}
