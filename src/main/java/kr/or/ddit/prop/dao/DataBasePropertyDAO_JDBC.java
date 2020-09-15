package kr.or.ddit.prop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.vo.DataBasePropertyVO;

public class DataBasePropertyDAO_JDBC implements IDataBasePropertyDAO {
	
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	public Connection getConnection() throws SQLException{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "chan";
		String password = "java";
		Connection conn = DriverManager.getConnection(url, user, password);
		return conn;
	}
	@Override
	public List<DataBasePropertyVO> selectDataBaseProperties(DataBasePropertyVO param) {
		StringBuffer sql = new StringBuffer("SELECT property_name, property_value, description FROM database_properties WHERE 1=1 ");
/*
		StringBuffer where = null;
		if(param != null) {
			where = new StringBuffer();
			String ptrn = " %s LIKE '%%%s%%'";
			if(StringUtils.isNoneBlank(param.getProperty_name())){
				where.append(String.format(ptrn, "PROPERTY_NAME", param.getProperty_name()));
			}
			if(StringUtils.isNoneBlank(param.getProperty_value())){
				if(where.length()>0){
					where.append("AND");
				}
				where.append(String.format(ptrn, "PROPERTY_VALUE", param.getProperty_value()));
			}
			if(StringUtils.isNoneBlank(param.getDescription())){
				if(where.length()>0){
					where.append("AND");
				}
				where.append(String.format(ptrn, "DESCRIPTION", param.getDescription()));
			}
			if(where.length()>0){
				where.insert(0, " WHERE ")
			}
		}
		sql = sql + where;
		*/
		
		if(param != null) {
			String property_name = param.getProperty_name();
			String property_value = param.getProperty_value();
			String description = param.getDescription();
			if(StringUtils.isNoneBlank(property_name)) {
				sql.append(String.format("AND property_name LIKE '%%%s%%' ", property_name)); 
			}
			if(property_value != null) {
				sql.append(String.format("AND property_value LIKE '%%%s%%' ", property_value));
			}
			if(description != null) {
				sql.append(String.format("AND description LIKE '%%%s%%' ", description));
			}
		}
		
		List<DataBasePropertyVO> list = new ArrayList<>();
		try (
			Connection conn = getConnection();
			Statement stmt = conn.createStatement();
		) {
			ResultSet rs = stmt.executeQuery(sql.toString());
			while (rs.next()) {
				list.add(DataBasePropertyVO.builder().property_name(rs.getString(1)).property_value(rs.getString(2))
						.description(rs.getString(3)).build());
			}
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
	}

	@Override
	public List<String> selectAllProperty_names() {
		
		List<String> list = new ArrayList<>();
		try (
			Connection conn = getConnection();
			Statement stmt = conn.createStatement();

		) {
			StringBuffer sql = new StringBuffer("SELECT property_name FROM database_properties WHERE 1=1 ");
			ResultSet rs = stmt.executeQuery(sql.toString());
			while (rs.next()) {
				list.add(rs.getString(1));
			}
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);

		}
	}

}
