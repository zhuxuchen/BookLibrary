package com.ly.bl.dao;

import com.ly.bl.entity.User;

public interface UserMapper {
    User loginCheck(User user);
}
