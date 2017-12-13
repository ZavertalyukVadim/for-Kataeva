package com.services;

import com.dao.UserDao;
import com.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    public List<User> getAllUsers() {
        return userDao.findAll();
    }

    public boolean addUser(User user) {
        User save = userDao.save(user);
        return save != null;
    }

    public User updateUser(Integer id,User user) {
        User one = userDao.findOne(id);
        one.setUsername(user.getUsername());
        one.setPassword(user.getPassword());
        return userDao.save(one);
    }

    public boolean deleteUserById(Integer id) {
        try {
            userDao.delete(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public User getUserById(Integer id) {
        return userDao.findOne(id);

    }
}
