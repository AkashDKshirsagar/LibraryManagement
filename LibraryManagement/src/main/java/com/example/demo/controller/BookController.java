package com.example.demo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Book;
import com.example.demo.service.BookService;

@Controller
public class BookController 
{
	@Autowired
	private BookService bookService;
	
	@GetMapping("/")
	public String getBooks(@Param("keyword") String keyword, Model model)
	{
		model.addAttribute("books", bookService.listAllBooks(keyword));
		model.addAttribute("mode", "BOOK_VIEW");
		return "index";
	}
	
	@GetMapping("/newBook")
	public String newBook(Model model)
	{
		Book book = new Book();
		model.addAttribute(book);
		model.addAttribute("mode", "BOOK_NEW");
		return "index";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder)
	{
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-dd-mm"), false));
	}
	
	@PostMapping("/saveBook")
	public String saveBook(@ModelAttribute Book book, BindingResult bindingResult, Model model)
	{
		bookService.save(book);
		model.addAttribute("books", bookService.listAllBooks());
		model.addAttribute("mode", "BOOK_VIEW");
		return "index";
	}
	
	@GetMapping("/updateBook")
	public String updateBook(@RequestParam int id, Model model)
	{
		model.addAttribute("book", bookService.findById(id));
		model.addAttribute("mode", "BOOK_EDIT");
		return "index";
	}
	
	@GetMapping("/deleteBook")
	public String deleteBook(@RequestParam int id, Model model)
	{
		bookService.deleteById(id);
		model.addAttribute("books", bookService.listAllBooks());
		model.addAttribute("mode", "BOOK_VIEW");
		return "index";
	}
}






















