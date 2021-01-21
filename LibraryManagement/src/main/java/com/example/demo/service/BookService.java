package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Book;

public interface BookService {

	List<Book> listAllBooks();

	void save(Book book);

	Book findById(int id);

	void deleteById(int id);

	List<Book> listAllBooks(String keyword);

}
