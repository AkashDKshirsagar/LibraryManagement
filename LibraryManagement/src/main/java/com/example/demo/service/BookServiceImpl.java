package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Book;
import com.example.demo.repository.BookRepository;

@Service
public class BookServiceImpl implements BookService{
	@Autowired
	private BookRepository bookRepository;
	
	@Override
	public List<Book> listAllBooks() {
		return bookRepository.findAll();
	}

	@Override
	public void save(Book book) {
		bookRepository.save(book);
	}

	@Override
	public Book findById(int id) {
		Optional<Book> optional = bookRepository.findById(id);
		Book book = optional.get();
		return book;
	}

	@Override
	public void deleteById(int id) {
		bookRepository.deleteById(id);
	}

	@Override
	public List<Book> listAllBooks(String keyword) {
		if(keyword != null)
		{
			return bookRepository.findAll(keyword);
		}
		return bookRepository.findAll();
	}

}
