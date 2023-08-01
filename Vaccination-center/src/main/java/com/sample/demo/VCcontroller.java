package com.sample.demo;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class VCcontroller {

	
	@Autowired
	AdminDao dao;
	
	@Autowired 
	CenterRepo centerRepo;
	
	@Autowired
	CitizenRepo citizenRepo;
	
	@RequestMapping("vaccinationcenter")
	public void vcenter(HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.sendRedirect("centers");
	}
	
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("login.jsp");
		return mv;
	}
	
	@RequestMapping("login")
	public ModelAndView login() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("login.jsp");
		return mv;
	}
	
	@RequestMapping("checkLogin")
	public ModelAndView checkLogin(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		String name=dao.checkAdmin(request.getParameter("email"), request.getParameter("password"));
		if(name!=null) {
			mv.setViewName("success.jsp");
			mv.addObject("name",name);
		}
		else {
			mv.setViewName("fail.jsp");
		}
		return mv;
	}
	
	@RequestMapping("registerAdmin")
	public ModelAndView registerAdmin(HttpServletRequest request,HttpServletResponse response) throws IOException {
		ModelAndView mv=new ModelAndView();
		Admin admin=new Admin();
		admin.setName(request.getParameter("name"));
		admin.setEmail(request.getParameter("email"));
		admin.setPassword(request.getParameter("password")); 
		if(dao.getAdmin(request.getParameter("email"))==0) {
			mv.setViewName("successReg.jsp");
			dao.save(admin);
		}
		else{
			mv.setViewName("failReg.jsp"); 
		}
		return mv;
	}
	@RequestMapping("addCenter")
	public void addCenter(HttpServletRequest request,HttpServletResponse response) throws IOException {
		Center center=new Center();
		center.setLocation(request.getParameter("city"));
		center.setName(request.getParameter("name")); 
		int count=centerRepo.hasCenter(center.getName());
		if(count==0) {
			centerRepo.save(center);
			response.sendRedirect("centers");
		}
		else {
			response.sendRedirect("failCenterInsert.jsp");
		}
		
	}
	
	@RequestMapping("centers")
	public ModelAndView displayCenters() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("centers.jsp");
		mv.addObject("centers",centerRepo.findAll());
		return mv;
	}
	
	@RequestMapping("citizens")
	public ModelAndView displayCitizens() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("citizens.jsp");
		mv.addObject("citizens",citizenRepo.findAll());
		return mv;
	}
	
	//return all available centers
	@RequestMapping("addCitizen")
	public ModelAndView getCenters(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("addCitizen.jsp");
		mv.addObject("centers",centerRepo.getCenters());
		return mv;
	}
	
	@RequestMapping("insertCitizen")
	public void insertCitizen(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Citizen c=new Citizen();
		c.setCenter(request.getParameter("center"));
		c.setCity(request.getParameter("city"));
		c.setDoses(0);
		c.setStatus("Not Vaccinated");
		c.setName(request.getParameter("name"));
		int count=citizenRepo.getCitizen(c.getName());
		if(count==0) {
			citizenRepo.save(c);
			response.sendRedirect("citizens");
		}
		else{
			response.sendRedirect("failCitizenInsert.jsp"); 
		}
		
	}
	
	@RequestMapping("getCenter")
	public ModelAndView getCenter(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		//Center center=centerRepo.getSpecificCenter(Integer.parseInt(request.getParameter("id")));
		Center center=centerRepo.getSpecificCenterByName(request.getParameter("name")); 
		List<Citizen> citizens=citizenRepo.getCitizenListByCenter(request.getParameter("name"));
		mv.setViewName("viewCenter.jsp");
		mv.addObject("center",center);
		mv.addObject("citizens",citizens);
		return mv;
	}	
	
	@RequestMapping("editCenter")
	public void editCenter(HttpServletRequest request,HttpServletResponse response) throws IOException {
		Center center=new Center();
		center.setId(Integer.parseInt(request.getParameter("id")));
		center.setName(request.getParameter("name"));
		center.setLocation(request.getParameter("city"));
		centerRepo.save(center);
		List<Citizen> citizen=citizenRepo.getCitizenListByCenter(request.getParameter("oldName"));
		for(Citizen c:citizen) {
			c.setCenter(request.getParameter("name"));
			citizenRepo.save(c);
		}
		response.sendRedirect("centers");
	}
	
	@RequestMapping("deleteCenter")
	public void deleteCenter(HttpServletRequest request,HttpServletResponse response) throws IOException {
		centerRepo.deleteById(Integer.parseInt(request.getParameter("id")));
		List<Citizen> citizen=citizenRepo.getCitizenListByCenter(request.getParameter("name"));
		for(Citizen c:citizen) {
			c.setCenter(request.getParameter("name"));
			c.setCity(request.getParameter("city"));
			citizenRepo.deleteById(c.getId());;
		}
		response.sendRedirect("centers");
	}
	
	@RequestMapping("getCitizen")
	public ModelAndView getCitizen(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		Optional<Citizen> citizen=citizenRepo.findById(Integer.parseInt(request.getParameter("id")));
		List<String> centers=centerRepo.getCenters();
		mv.setViewName("editCitizen.jsp");
		mv.addObject("centers",centers);
		mv.addObject("citizen",citizen);
		return mv;
	}
	
	@RequestMapping("updateCitizen")
	public void updateCitizen(HttpServletRequest request,HttpServletResponse response) throws IOException {
		Citizen citizen=new Citizen();
		citizen.setId(Integer.parseInt(request.getParameter("id")));
		citizen.setName(request.getParameter("name"));
		citizen.setCity(request.getParameter("city"));
		citizen.setCenter(request.getParameter("center"));
		citizen.setDoses(Integer.parseInt(request.getParameter("doses")));
		if(citizen.getDoses()==1) {
			citizen.setStatus("Partially vaccinated");
		}
		else if(citizen.getDoses()==0) {
			citizen.setStatus("Not vaccinated");
		}
		else {
			citizen.setStatus("Fully vaccinated");
		}
		citizenRepo.save(citizen);
		response.sendRedirect("citizens"); 
	}
	
	
	@RequestMapping("deleteCitizen")
	public void deleteCitizen(HttpServletRequest request,HttpServletResponse response) throws IOException {
		citizenRepo.deleteById(Integer.parseInt(request.getParameter("id")));
		response.sendRedirect("citizens");
	}
	
	
	
	
}
