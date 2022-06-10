package com.ly.bl.service.impl;

import com.ly.bl.dao.BookMapper;
import com.ly.bl.entity.Book;
import com.ly.bl.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    BookMapper bookMapper;

    @Override
    public List<Book> getAllBooks() {
        return bookMapper.getAllBooks();
    }

    @Override
    public Book getBookById(int id) {
        return null;
    }
}
