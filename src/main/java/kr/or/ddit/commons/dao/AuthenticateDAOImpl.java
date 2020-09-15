package kr.or.ddit.commons.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Objects;

import kr.or.ddit.db.ConnectionFactory;
import kr.or.ddit.vo.MemberVO;

public class AuthenticateDAOImpl implements IAuthenticateDAO{
	private static AuthenticateDAOImpl self;

	public static AuthenticateDAOImpl getInstance() {
		if(self==null)
			self = new AuthenticateDAOImpl();
		return self;
	}
	
	private AuthenticateDAOImpl() {
		super();
		// TODO Auto-generated constructor stub
	}


	@Override
	public MemberVO selectMember(MemberVO member){
		StringBuffer sql = new StringBuffer();
		sql.append("select								");
	    sql.append("mem_id,                             ");
	    sql.append("mem_pass,                           ");
	    sql.append("mem_name,                           ");
	    sql.append("mem_regno1,                         ");
	    sql.append("mem_regno2,                         ");
	    sql.append("mem_bir,                            ");
	    sql.append("mem_zip,                            ");
	    sql.append("mem_add1,                           ");
	    sql.append("mem_add2,                           ");
	    sql.append("mem_hometel,                        ");
	    sql.append("mem_comtel,                         ");
	    sql.append("mem_hp,                             ");
	    sql.append("mem_mail,                           ");
	    sql.append("mem_job,                            ");
	    sql.append("mem_like,                           ");
	    sql.append("mem_memorial,                       ");
	    sql.append("mem_memorialday,                    ");
	    sql.append("mem_mileage,                        ");
	    sql.append("mem_delete                          ");
		sql.append("from member                         ");
		sql.append("WHERE MEM_ID = ?");
		MemberVO savedMember = null;
		try (
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, member.getMem_id());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				savedMember = MemberVO.builder()
						.mem_id(rs.getString("mem_id"))
						.mem_pass(rs.getString("mem_pass"))
						.mem_name(rs.getString("mem_name"))
						.mem_regno1(rs.getString("mem_regno1"))
						.mem_regno2(rs.getString("mem_regno2"))
						.mem_bir(rs.getString("mem_bir"))
						.mem_zip(rs.getString("mem_zip"))
						.mem_add1(rs.getString("mem_add1"))
						.mem_add2(rs.getString("mem_add2"))
						.mem_hometel(rs.getString("mem_hometel"))
						.mem_comtel(rs.getString("mem_comtel"))
						.mem_hp(rs.getString("mem_hp"))
						.mem_mail(rs.getString("mem_mail"))
						.mem_job(rs.getString("mem_job"))
						.mem_like(rs.getString("mem_like"))
						.mem_memorial(rs.getString("mem_like"))
						.mem_memorialday(rs.getString("mem_memorialday"))
						.mem_mileage(rs.getInt("mem_mileage"))
						.mem_delete(rs.getString("mem_delete"))
						.build();
			}
			return savedMember;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e); // 호출자에게 제어권한을 넘김
		}
	}

}
