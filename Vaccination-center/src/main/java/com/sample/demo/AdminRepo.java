package com.sample.demo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AdminRepo extends JpaRepository<Admin, String> {
	@Query("select name from Admin where email=?1 and password=?2")
	public String checkAdmin(String email,String password);
	
	@Query("select count(*) from Admin where email=?1")
	public int getAdmin(String email);
}
