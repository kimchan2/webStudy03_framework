package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ZiptbVO;

public interface IZipSearchService {
	public List<ZiptbVO> selectByZipcode(PagingVO pagingVO);
}
