package com.table;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TestCrud {

	public void addUserTest(String title,String category,String name,String score) throws SQLException, ClassNotFoundException {
		DBdriver driver=new DBdriver();
		Connection connect=driver.getConnection();
		int row=0;
		String exist="select count(*) c from test where title=? and name=?";
		PreparedStatement ps1=connect.prepareStatement(exist);
		ps1.setString(1, title);
		ps1.setString(2, name);
		ResultSet rs=ps1.executeQuery();
		while(rs.next()) {
			row=rs.getInt(1);
		}
		System.out.println(row);
		if(row==0) {
			String add="insert into test values(?,?,?,?)";
			PreparedStatement ps2=connect.prepareStatement(add);
			ps2.setString(1, name);
			ps2.setString(2, title);
			ps2.setString(3, category);
			ps2.setInt(4, Integer.parseInt(score));
			ps2.executeUpdate();
		}
	
	}
	
	public void updateScore(int result,String title,String category,String name) throws SQLException, ClassNotFoundException {
		DBdriver driver=new DBdriver();
		Connection connect=driver.getConnection();
		int row=0;
		String exist="select score from test where title=? and name=?";
		PreparedStatement ps1=connect.prepareStatement(exist);
		ps1.setString(1, title);
		ps1.setString(2, name);
		ResultSet rs=ps1.executeQuery();
		while(rs.next()) {
			row=rs.getInt(1);
		}
		if(row<result) {
			String update="update test set score=? where title=? and name=?";
			PreparedStatement ps2=connect.prepareStatement(update);
			ps2.setInt(1, result);
			ps2.setString(2, title);
			ps2.setString(3, name);
			ps2.executeUpdate();
		}
		else {
			return;
		}
		
	}
	public List<Test> getLeaderBoardList(String title) throws SQLException, ClassNotFoundException {
		DBdriver driver=new DBdriver();
		Connection connect=driver.getConnection();
		String s="select * from test where title=? order by score desc";
		PreparedStatement ps=connect.prepareStatement(s);
		ps.setString(1, title);
		ResultSet rs=ps.executeQuery();
		List<Test> list=new ArrayList<>();
		while(rs.next()) {
			Test test=new Test();
			test.score=rs.getInt("score");
			test.title=rs.getString("title");
			test.category=rs.getString("category");
			test.name=rs.getString("name");
			list.add(test);
		};
		
		return list;
	}
}
