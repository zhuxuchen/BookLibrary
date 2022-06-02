package com.ly.bl.service;

import com.ly.bl.entity.User;

public interface UserService {
    User loginCheck(String email, String password);
}
