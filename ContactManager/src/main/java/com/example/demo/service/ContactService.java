package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Contact;

public interface ContactService 
{

	List<Contact> listAllContact();

	void save(Contact contact);

	Contact findById(int id);

	void deleteById(int id);

	List<Contact> listAllContact(String keyword);

}
