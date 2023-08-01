package com.sample.demo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CenterRepo extends JpaRepository<Center, Integer>{
	@Query("select name from Center")
	public List<String> getCenters();
	

	@Query("from Center where id=?1")
	public Center getSpecificCenter(int id);

	@Query("select count(*) from Center where name=?1")
	public int hasCenter(String name);


	@Query("from Center where name=?1")
	public Center getSpecificCenterByName(String name);

	
	
}
