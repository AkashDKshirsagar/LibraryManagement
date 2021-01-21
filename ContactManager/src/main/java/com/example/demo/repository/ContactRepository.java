package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.Contact;

public interface ContactRepository extends JpaRepository<Contact, Integer>
{
	@Query("SELECT c FROM Contact c WHERE c.firstName LIKE %?1%"
			+"OR c.lastName LIKE %?1%")
	public List<Contact> findAll(String keyword);
}
