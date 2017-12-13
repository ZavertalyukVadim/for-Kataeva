package com.controllers;

import com.entities.User;
import com.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/api/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping
    public List<User> getAllUsers(){
        return userService.getAllUsers();
    }

    @GetMapping(value = "/{id}")
    public User getUserById(@PathVariable("id") Integer id){
        return userService.getUserById(id);
    }

    @DeleteMapping(value = "/{id}")
    public boolean deleteUserById(@PathVariable("id") Integer id){
        return userService.deleteUserById(id);
    }

    @PutMapping(value = "/{id}")
    public User updateUser(@PathVariable("id") Integer id,@RequestBody User user){
        return userService.updateUser(id,user);
    }

    @PostMapping
    public boolean addUser(@RequestBody User user){
        return userService.addUser(user);
    }
}
