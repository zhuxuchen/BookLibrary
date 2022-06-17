package com.ly.bl.controller;

import com.ly.bl.entity.User;
import com.ly.bl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class UserContorller {
    @Autowired
    UserService userService;

    @RequestMapping("login.html")
    public String loginPage(){
        return "login";
    }

//    @RequestMapping("books.html")
//    public String bookPage(){
//        return "books";
//    }

    //登录功能
    @RequestMapping("login.do")
    public String loginDO(String email, String password, Model model,
                          HttpSession httpSession){
        User user = userService.loginCheck(email,password);
        if (user == null){
            model.addAttribute("msg","用户名或密码错误！");
            return "login";
        }
        httpSession.setAttribute("user",user);
        return "redirect:/books.html";
    }
}
