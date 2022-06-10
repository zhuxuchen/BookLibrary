package com.ly.bl.controller;

import com.ly.bl.entity.Book;
import com.ly.bl.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
}
