package com.dao;

import com.entities.Project;
import com.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProjectDao extends JpaRepository<Project,Integer>{
    List<Project> findAllByUser(User currentUser);
}
