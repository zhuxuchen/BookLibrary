package com.ly.bl.entity;

import java.sql.Date;

public class Recoder {
	private int id;
	private int user_id;
	private int book_id;
	private Date borrowtime;
	private Date remandtime;
	
	private User user;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public Date getBorrowtime() {
		return borrowtime;
	}
	public void setBorrowtime(Date borrowtime) {
		this.borrowtime = borrowtime;
	}
	public Date getRemandtime() {
		return remandtime;
	}
	public void setRemandtime(Date remandtime) {
		this.remandtime = remandtime;
	}	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public String toString() {
		return "Recoder [id=" + id + ", user_id=" + user_id + ", book_id=" + book_id + ", borrowtime=" + borrowtime
				+ ", remandtime=" + remandtime + "]";
	}
	
	
}
