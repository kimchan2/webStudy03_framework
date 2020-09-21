package kr.or.ddit.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.ddit.db.ConnectionFactory;
import kr.or.ddit.db.CustomSqlSessionFactoryBuilder;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ZiptbVO;

public class MemberDAOImpl implements IMemberDAO{
	private static MemberDAOImpl self;
	private SqlSessionFactory sqlSessionFactory = CustomSqlSessionFactoryBuilder.getSqlSessionFactory();
	
	private MemberDAOImpl() {
		super();
	}
	
	public static MemberDAOImpl getInstance() {
		if(self==null)
			self = new MemberDAOImpl();
		return self;
	}
	
	@Override
	public int insertMember(MemberVO member) {
		try(
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
		){
			IMemberDAO mapper = sqlSession.getMapper(IMemberDAO.class);
			return mapper.insertMember(member);
//			return sqlSession.insert("kr.or.ddit.member.dao.IMemberDAO.insertMember", member);
		}
		/*// TODO Auto-generated method stub
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO member (                                                 ");
		sql.append("	    mem_id, mem_pass, mem_name, mem_regno1, mem_regno2, mem_bir, ");
		sql.append("	    mem_zip, mem_add1, mem_add2, mem_hometel, mem_comtel, mem_hp,");
		sql.append("	    mem_mail, mem_job, mem_like, mem_memorial, mem_memorialday,  ");
		sql.append("	    mem_mileage, mem_delete                                      ");
		sql.append("	) VALUES (                                                       ");
		sql.append("	    ?, ?, ?, ?,                                                  ");
		sql.append("	    ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?,                                                  ");
		sql.append("	    ?, ?, ?, ?,                                                  ");
		sql.append("	    ?, ?, ?, ?,                                                  ");
		sql.append("	    TO_DATE(?, 'YYYY-MM-DD'), ?, ?                                                     ");
		sql.append("	)                                                                ");
		try(
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, member.getMem_id());
			pstmt.setString(2, member.getMem_pass());
			pstmt.setString(3, member.getMem_name());
			pstmt.setString(4, member.getMem_regno1());
			pstmt.setString(5, member.getMem_regno2());
			pstmt.setString(6, member.getMem_bir());
			pstmt.setString(7, member.getMem_zip());
			pstmt.setString(8, member.getMem_add1());
			pstmt.setString(9, member.getMem_add2());
			pstmt.setString(10, member.getMem_hometel());
			pstmt.setString(11, member.getMem_comtel());
			pstmt.setString(12, member.getMem_hp());
			pstmt.setString(13, member.getMem_mail());
			pstmt.setString(14, member.getMem_job());
			pstmt.setString(15, member.getMem_like());
			pstmt.setString(16, member.getMem_memorial());
			pstmt.setString(17, member.getMem_memorialday());
			pstmt.setInt(18, member.getMem_mileage());
			pstmt.setString(19, member.getMem_delete());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			throw new RuntimeException(e);
		}*/
	}

	@Override
	public int selectMemberCount(PagingVO<MemberVO> pagingVO) {
		try(
			SqlSession session = sqlSessionFactory.openSession();
		){
			IMemberDAO mapper = session.getMapper(IMemberDAO.class);
			return mapper.selectMemberCount(pagingVO);
		}
	}
	
	@Override
	public List<MemberVO> selectMemberList(PagingVO<MemberVO> pagingVO) {
		try(
			SqlSession sqlSession = sqlSessionFactory.openSession();
		){
			IMemberDAO mapper = sqlSession.getMapper(IMemberDAO.class);
			return mapper.selectMemberList(pagingVO);
		}
	}

	@Override
	public MemberVO selectMember(String mem_id) {
		try(
			SqlSession sqlSession = sqlSessionFactory.openSession();
		){
			IMemberDAO mapper = sqlSession.getMapper(IMemberDAO.class);
			return mapper.selectMember(mem_id);
//			return sqlSession.selectOne("kr.or.ddit.member.dao.IMemberDAO.selectMember", mem_id);
		}

		/*StringBuffer sql = new StringBuffer();
		sql.append("SELECT									");
	    sql.append("mem_id,                             	");
	    sql.append("mem_pass,                           	");
	    sql.append("mem_name,                           	");
	    sql.append("mem_regno1,                        	 	");
	    sql.append("mem_regno2,                         	");
	    sql.append("TO_CHAR(mem_bir, 'YYYY-MM-DD') mem_bir, ");
	    sql.append("mem_zip,                            	");
	    sql.append("mem_add1,                           	");
	    sql.append("mem_add2,                           	");
	    sql.append("mem_hometel,                        	");
	    sql.append("mem_comtel,                         	");
	    sql.append("mem_hp,                             	");
	    sql.append("mem_mail,                           	");
	    sql.append("mem_job,                            	");
	    sql.append("mem_like,                           	");
	    sql.append("mem_memorial,                       	");
	    sql.append("TO_CHAR(mem_memorialday, 'YYYY-MM-DD') mem_memorialday, ");
	    sql.append("mem_mileage,                        	");
	    sql.append("mem_delete ");
		sql.append("FROM member ");
		sql.append("WHERE MEM_ID = ?");
		MemberVO savedMember = null;
		try (
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, mem_id);
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
		}*/
	}

	@Override
	public int updateMember(MemberVO member) {
		try(
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
		){
			IMemberDAO mapper = sqlSession.getMapper(IMemberDAO.class);
			return mapper.updateMember(member);
		}
	}

	@Override
	public int deleteMember(String mem_id) {
		try(
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
		){
			IMemberDAO mapper = sqlSession.getMapper(IMemberDAO.class);
			return mapper.deleteMember(mem_id);
		}
	}
	
}