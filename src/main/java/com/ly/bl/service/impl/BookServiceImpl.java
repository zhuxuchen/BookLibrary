package com.ly.bl.service.impl;

import com.ly.bl.dao.BookMapper;
import com.ly.bl.dao.RecoderMapper;
import com.ly.bl.entity.Book;
import com.ly.bl.entity.Recoder;
import com.ly.bl.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    BookMapper bookMapper;

    @Autowired
    RecoderMapper recoderMapper;

    @Override
    public List<Book> getAllBooks() {
        return bookMapper.getAllBooks();
    }

    @Override
    public Book getBookById(int id) {
        return bookMapper.getBookById(id);
    }

    @Override
    public int addBorrowRecoder(Recoder recoder) {
        return recoderMapper.addBorrowRecoder(recoder);
    }
}
