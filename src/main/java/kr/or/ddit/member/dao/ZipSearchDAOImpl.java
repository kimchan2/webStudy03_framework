package kr.or.ddit.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.ddit.db.CustomSqlSessionFactoryBuilder;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ZiptbVO;

public class ZipSearchDAOImpl implements IZipSearchDAO{
	private static ZipSearchDAOImpl zipSearchDAO;
	private SqlSessionFactory sqlSessionFactory = CustomSqlSessionFactoryBuilder.getSqlSessionFactory();

	private ZipSearchDAOImpl(){
		super();
	}
	
	public static ZipSearchDAOImpl getInstance() {
		if(zipSearchDAO == null)
			zipSearchDAO = new ZipSearchDAOImpl();
		return zipSearchDAO;
	}
	public List<ZiptbVO> selectByZipcode(PagingVO pagingVO){
		try(
			SqlSession session = sqlSessionFactory.openSession();
		){
			IZipSearchDAO mapper = session.getMapper(IZipSearchDAO.class);
			return mapper.selectByZipcode(pagingVO);
		}
	}

	@Override
	public int selectTotalCount(PagingVO pagingVO) {
		try(
				SqlSession session = sqlSessionFactory.openSession();
		){
			IZipSearchDAO mapper = session.getMapper(IZipSearchDAO.class);
			return mapper.selectTotalCount(pagingVO);
		}
	}
}
