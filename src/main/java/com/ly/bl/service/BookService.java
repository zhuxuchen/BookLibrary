package com.ly.bl.service;

import com.ly.bl.entity.Book;

import java.util.List;

public interface BookService {
    List<Book> getAllBooks();
    Book getBookById(int id);
}
