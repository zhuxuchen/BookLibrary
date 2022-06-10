package com.ly.bl.dao;

import com.ly.bl.entity.Book;

import java.util.List;

public interface BookMapper {
    //查询所有图书
    List<Book> getAllBooks();
}
