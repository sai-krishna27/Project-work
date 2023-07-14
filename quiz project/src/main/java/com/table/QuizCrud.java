package com.table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class QuizCrud {
	public List<QuizList> getQuizList() throws SQLException, ClassNotFoundException {
		DBdriver driver=new DBdriver();
		Connection connect=driver.getConnection();
		String s="select * from quiz_list";
		PreparedStatement ps=connect.prepareStatement(s);
		ResultSet rs=ps.executeQuery();
		List<QuizList> list=new ArrayList<>();
		while(rs.next()) {
			QuizList ql=new QuizList();
			ql.id=rs.getInt("id");
			ql.title=rs.getString("title");
			ql.category=rs.getString("category");
			list.add(ql);
		};
		
		return list;
	}
	
	
	public void updateQuizTitle(String newTitle,String title,String category,String id) throws SQLException, ClassNotFoundException {
		DBdriver driver=new DBdriver();
		Connection connect=driver.getConnection();
		String s="update quiz_list set title=? where id=?";
		PreparedStatement ps=connect.prepareStatement(s);
		ps.setString(1, newTitle);
		ps.setInt(2, Integer.parseInt(id));
		ps.executeUpdate();
		String db="use "+category;
		Statement st1=connect.createStatement();
		st1.executeUpdate(db);
		String table="rename table "+title+" to "+newTitle;
		try {
		Statement st2=connect.createStatement();
		st2.executeUpdate(table);
		}
		catch (Exception e) {
			
		}
		
	}
	
	public void deleteQuiz(String title,String category,String id) throws SQLException, ClassNotFoundException {
		DBdriver driver=new DBdriver();
		Connection connect=driver.getConnection();
		String quiz="delete from quiz_list where id="+Integer.parseInt(id);
		Statement st1=connect.createStatement();
		st1.executeUpdate(quiz);
		String db="use "+category;
		Statement st2=connect.createStatement();
		st2.executeUpdate(db);
		String table="drop table "+title;
		Statement st3=connect.createStatement();
		st3.executeUpdate(table);
	}
	
	public int insert(String title,String category) throws SQLException, ClassNotFoundException {
		
		
		DBdriver driver=new DBdriver();
		Connection connect=driver.getConnection();
		
		String query="insert into quiz_list(title,category) values(?,?)";
		PreparedStatement ps=connect.prepareStatement(query);
		ps.setString(1, title);
		ps.setString(2, category);
		int row;
		try {
			row=ps.executeUpdate();
		}
		catch(Exception e) {
			return -1;
		}
		
		try {
			String db="create database "+category;
			PreparedStatement ps2=connect.prepareStatement(db);
			ps2.executeUpdate();
			
		}
		catch(Exception e) {
			System.out.println("database exists");
		}
		try {
			String s="use "+category;
			PreparedStatement ps1=connect.prepareStatement(s);
			ps1.executeUpdate();
			String table="create table "+title+"(id int primary key auto_increment,ques varchar(200),op1 varchar(20),op2 varchar(20),op3 varchar(20),op4 varchar(20),correct varchar(20));";
			Statement s1=connect.createStatement();
			s1.execute(table);
		}
		catch(Exception e) {
			
		}
		return row;
	}
	
	public boolean hasCategory(String title,String category) throws SQLException, ClassNotFoundException {
		DBdriver driver=new DBdriver();
		Connection connect=driver.getConnection();
		try {
			String s="use "+category;
			PreparedStatement ps1=connect.prepareStatement(s);
			ps1.executeUpdate();
			String table="select * from "+title;
			Statement s1=connect.createStatement();
			s1.executeQuery(table);
		}
		catch(Exception e) {
			return false;
		}
		return true;
	}
	
	
}
