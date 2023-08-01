package com.sample.demo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CitizenRepo extends JpaRepository<Citizen, Integer> {
	@Query("select count(*) from Citizen where name=?1")
	public int getCitizen(String name);

	@Query("from Citizen where center=?1")
	public List<Citizen> getCitizenListByCenter(String name);


			
}
