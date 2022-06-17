package com.ly.bl.controller;

import com.ly.bl.entity.Book;
import com.ly.bl.entity.Recoder;
import com.ly.bl.entity.User;
import com.ly.bl.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class BookController {
    @Autowired
    BookService bookService;

    @RequestMapping("/books.html")
    String bookPage(Model model){
        List<Book> books =  bookService.getAllBooks();
        System.out.println(books);
        model.addAttribute("books",books);
        return "books";
    }

    @ResponseBody
    @RequestMapping("/getbookbyid")
    public Book getBookById(Integer id){
        return bookService.getBookById(id);
    }

    @ResponseBody
    @RequestMapping("/borrow")
    public String borrowBook(Integer id, String returnTime, HttpSession httpSession) throws ParseException {
        System.out.println("id : " + id + ", returnTime : " + returnTime);
        Recoder recoder = new Recoder();
        recoder.setBook_id(id);
        recoder.setBorrowtime((java.sql.Date) new Date());
        SimpleDateFormat df = new SimpleDateFormat("yyyy-mm-dd");
        recoder.setRemandtime((java.sql.Date) df.parse(returnTime));
        //差一个用户id
        User user = (User) httpSession.getAttribute("user");
        recoder.setUser_id(user.getId());

        bookService.addBorrowRecoder(recoder);
        return "ok";
    }

    @RequestMapping("/borrow.html")
    public String currentBorrowPage(HttpSession httpSession, Model model){
        return "borrow";
    }
}
