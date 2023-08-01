package com.sample.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminDao {
	@Autowired
	AdminRepo repo;
	

	public String checkAdmin(String email, String password) {
		return repo.checkAdmin(email, password);
	}

	public int getAdmin(String email) {
		return repo.getAdmin(email);
	}

	public Admin save(Admin admin) {
		return repo.save(admin); 
		
	}
}
