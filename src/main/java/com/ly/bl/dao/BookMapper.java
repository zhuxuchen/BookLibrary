package com.ly.bl.dao;

import com.ly.bl.entity.Book;

import java.util.List;

public interface BookMapper {
    //查询所有图书
    List<Book> getAllBooks();

    Book getBookById(int id);

    //根据用户id查询当前借阅的图书
    List<Book> getCurrentBorrowByUserid(int user_id);

}
