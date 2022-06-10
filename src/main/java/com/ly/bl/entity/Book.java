package com.ly.bl.entity;

import java.util.Date;

public class Book {
    private Integer id;        //图书编号
    private String name;       //图书名称
    private String isbn;       //图书标准ISBN编号
    private String press;      //图书出版社
    private String author;     //图书作者
    private Integer pagination;//图书页数
    private Double price;      //图书价格
    private Date uploadtime;
    private Recoder currentRecoder; //本书当前借阅记录
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Integer getPagination() {
		return pagination;
	}
	public void setPagination(Integer pagination) {
		this.pagination = pagination;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Date getUploadtime() {
		return uploadtime;
	}
	public void setUploadtime(Date uploadtime) {
		this.uploadtime = uploadtime;
	}
	public Recoder getCurrentRecoder() {
		return currentRecoder;
	}
	public void setCurrentRecoder(Recoder currentRecoder) {
		this.currentRecoder = currentRecoder;
	}
	@Override
	public String toString() {
		return "\nBook [id=" + id + ", name=" + name + ", isbn=" + isbn + ", press=" + press + ", author=" + author
				+ ", pagination=" + pagination + ", price=" + price + ", uploadtime=" + uploadtime + ", currentRecoder="
				+ currentRecoder + "]";
	}
	
	
    
    
}
