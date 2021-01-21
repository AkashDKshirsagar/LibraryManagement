package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Contact;
import com.example.demo.repository.ContactRepository;

@Service
public class ContactServiceImpl implements ContactService
{
	@Autowired
	private ContactRepository contactRepository; 

	@Override
	public List<Contact> listAllContact() {
		return contactRepository.findAll();
	}

	@Override
	public void save(Contact contact) {
		contactRepository.save(contact);
	}

	@Override
	public Contact findById(int id) {
		Optional<Contact> optional = contactRepository.findById(id);
		Contact contact = optional.get();
		return contact;
	}

	@Override
	public void deleteById(int id) {
		contactRepository.deleteById(id);
	}

	@Override
	public List<Contact> listAllContact(String keyword) {
		if(keyword != null)
		{
			return contactRepository.findAll(keyword);
		}
		return contactRepository.findAll();
	}

}