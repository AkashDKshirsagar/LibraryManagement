package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.Book;

public interface BookRepository extends JpaRepository<Book, Integer>
{
	@Query("SELECT b FROM Book b WHERE b.bookName LIKE %?1%"
			+ "OR b.author LIKE %?1%")
	public List<Book> findAll(String keyword);
}