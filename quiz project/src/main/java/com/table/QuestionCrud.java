package com.table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class QuestionCrud {
	
	public void insert(QuestionList ql,String title,String category) throws SQLException, ClassNotFoundException {
		DBdriver driver=new DBdriver();
		Connection connect=driver.getConnection();
		String db="use "+category;
		Statement st1=connect.createStatement();
		st1.executeUpdate(db);
		String s="insert into "+title+"(ques,op1,op2,op3,op4,correct) values(?,?,?,?,?,?)";
		PreparedStatement ps=connect.prepareStatement(s);
		ps.setString(1, ql.question);
		ps.setString(2, ql.op1);
		ps.setString(3, ql.op2);
		ps.setString(4, ql.op3);
		ps.setString(5, ql.op4);
		ps.setString(6, ql.correct);
		ps.executeUpdate();
	}
	
	public void updateQuestion(String title,String category,String id,String question,String op1,String op2,String op3,String op4,String correct) throws SQLException, ClassNotFoundException {
		DBdriver driver=new DBdriver();
		Connection connect=driver.getConnection();
		String db="use "+category;
		Statement st1=connect.createStatement();
		st1.executeUpdate(db);
		String s="update "+title+" set ques=?,op1=?,op2=?,op3=?,op4=?,correct=? where id=?";
		PreparedStatement ps=connect.prepareStatement(s);
		ps.setString(1, question);
		ps.setInt(7, Integer.parseInt(id));
		ps.setString(2, op1);
		ps.setString(3, op2);
		ps.setString(4, op3);
		ps.setString(5, op4);
		ps.setString(6, correct);
		ps.executeUpdate();
	}
	
	public void deleteQues(String title,String category,String id) throws SQLException, ClassNotFoundException {
		DBdriver driver=new DBdriver();
		Connection connect=driver.getConnection();
		String db="use "+category;
		Statement st1=connect.createStatement();
		st1.executeUpdate(db);
		String s="delete from "+title+" where id=?";
		PreparedStatement ps=connect.prepareStatement(s);
		ps.setInt(1, Integer.parseInt(id) );
		ps.executeUpdate();
	}
	
	public List<QuestionList> getQuestionList(String title,String category) throws SQLException, ClassNotFoundException {
		DBdriver driver=new DBdriver();
		Connection connect=driver.getConnection();
		String db="use "+category;
		Statement st1=connect.createStatement();
		st1.executeUpdate(db);
		String s="select * from "+title;
		PreparedStatement ps=connect.prepareStatement(s);
		ResultSet rs=ps.executeQuery();
		List<QuestionList> list=new ArrayList<>();
		while(rs.next()) {
			QuestionList ql=new QuestionList();
			ql.id=rs.getInt("id");
			ql.question=rs.getString("ques");
			ql.op1=rs.getString("op1");
			ql.op2=rs.getString("op2");
			ql.op3=rs.getString("op3");
			ql.op4=rs.getString("op4");
			ql.correct=rs.getString("correct");
			list.add(ql);
		};
		
		return list;
	}
}
