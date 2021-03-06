package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Contact;
import com.example.demo.service.ContactService;

@Controller
public class ContactController 
{
	@Autowired
	private ContactService contactService;
	
	@GetMapping("/")
	public String contactList(@Param("keyword") String keyword, Model model)
	{
		model.addAttribute("contacts", contactService.listAllContact(keyword));
		model.addAttribute("mode", "CONTACT_VIEW");
		return "home";
	}
	
	@GetMapping("/newContact")
	public String newContact(Model model)
	{
		Contact contact = new Contact();
		model.addAttribute(contact);
		model.addAttribute("mode", "CONTACT_NEW");
		return "home";
	}
	
	@PostMapping("/saveContact")
	public String saveContact(@ModelAttribute Contact contact, BindingResult bindingResult, Model model)
	{
		contactService.save(contact);
		model.addAttribute("contacts", contactService.listAllContact());
		model.addAttribute("mode", "CONTACT_VIEW");
		return "home";
	}
	
	@GetMapping("/updateContact")
	public String updateContact(@RequestParam int id, Model model)
	{
		model.addAttribute("contact", contactService.findById(id));
		model.addAttribute("mode", "CONTACT_EDIT");
		return "home";
	}
	
	@GetMapping("deleteContact")
	public String deleteContact(@RequestParam int id, Model model)
	{
		contactService.deleteById(id);
		model.addAttribute("contacts", contactService.listAllContact());
		model.addAttribute("mode", "CONTACT_VIEW");
		return "home";
	}
}
