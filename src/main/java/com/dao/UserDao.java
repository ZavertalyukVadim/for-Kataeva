package com.dao;

import com.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao extends JpaRepository<User,Integer>{
    User findUserByUsername(String username);

}
