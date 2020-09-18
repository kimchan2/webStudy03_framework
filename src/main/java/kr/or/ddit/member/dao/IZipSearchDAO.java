package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ZiptbVO;

public interface IZipSearchDAO {
	public int selectTotalCount(PagingVO pagingVO);
	public List<ZiptbVO> selectByZipcode(PagingVO pagingVO);
}
