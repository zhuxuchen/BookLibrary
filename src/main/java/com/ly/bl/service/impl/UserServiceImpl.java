package com.ly.bl.service.impl;

import com.ly.bl.dao.UserMapper;
import com.ly.bl.entity.User;
import com.ly.bl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public User loginCheck(String email, String password) {
        User u = new User();
        u.setEmail(email);
        u.setPassword(password);
        return userMapper.loginCheck(u);
    }
}
