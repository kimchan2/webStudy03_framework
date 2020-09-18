package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.dao.IZipSearchDAO;
import kr.or.ddit.member.dao.ZipSearchDAOImpl;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ZiptbVO;

public class ZipSearchServiceImpl implements IZipSearchService{
	IZipSearchDAO zipDAO = ZipSearchDAOImpl.getInstance();
	private static ZipSearchServiceImpl zipSearchServiceImpl;
	
	private ZipSearchServiceImpl() {
		super();
	}
	
	public static ZipSearchServiceImpl getInstance() {
		if(zipSearchServiceImpl == null)
			zipSearchServiceImpl = new ZipSearchServiceImpl();
		return zipSearchServiceImpl;
	}
	
	@Override
	public List<ZiptbVO> selectByZipcode(PagingVO pagingVO){
		return zipDAO.selectByZipcode(pagingVO);
	}
}
