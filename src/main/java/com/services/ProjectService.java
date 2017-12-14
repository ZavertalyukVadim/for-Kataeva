package com.services;

import com.dao.ProjectDao;
import com.dao.UserDao;
import com.entities.Project;
import com.entities.Stage;
import com.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ProjectService {

    private final ProjectDao projectDao;
    private final UserDao userDao;

    @Autowired
    public ProjectService(ProjectDao projectDao, UserDao userDao) {
        this.projectDao = projectDao;
        this.userDao = userDao;
    }

    public List<Project> getAllProjects() {
        List<Project> list = projectDao.findAllByUser(getCurrentUser());
        return list;
    }

    public Integer addProject(Project project) {
        project.setUser(getCurrentUser());
        Project save = projectDao.save(project);
        return save.getId();
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
        Stage stage1 = new Stage("name1","description1",20,10,4);
        stage1.setProject(project);

        project.addStage(stage);
        project.addStage(stage1);
        projectDao.save(project);
    }

    public boolean addProjectForUser(Integer id, Project project) {
        User user = userDao.findOne(id);
        if (user!=null) {
            user.addProject(project);
            project.setUser(user);
            userDao.save(user);
            return true;
        }
        return false;
    }

    private User getCurrentUser() {
        User user = userDao.findUserByUsername(getUserEmail());
        return user;
    }

    private String getUserEmail() {
        return getUserDetails().getName();
    }

    private Authentication getUserDetails() {
        return SecurityContextHolder.getContext().getAuthentication();
    }
}
