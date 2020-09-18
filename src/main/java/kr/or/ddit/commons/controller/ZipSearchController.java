package kr.or.ddit.commons.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.member.dao.IZipSearchDAO;
import kr.or.ddit.member.dao.ZipSearchDAOImpl;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IZipSearchService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.service.ZipSearchServiceImpl;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ZiptbVO;

@WebServlet("/zipSearch.do")
public class ZipSearchController extends HttpServlet{
	private IZipSearchService service = ZipSearchServiceImpl.getInstance();
	IZipSearchDAO dao = ZipSearchDAOImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String pageParam = req.getParameter("page");
		
		int currentPage = 1;
		PagingVO<ZiptbVO> pagingVO = new PagingVO();
		int totalRecord = dao.selectTotalCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		if(StringUtils.isNotBlank(pageParam) && StringUtils.isNumeric(pageParam)) {
			currentPage = Integer.parseInt(pageParam);
		}
		pagingVO.setCurrentPage(currentPage);
		
		List<ZiptbVO> zipList = new ArrayList<>();
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		
		String dong = req.getParameter("searchWord");
		if(StringUtils.isNotBlank(dong)) {
			pagingVO.setSearchWord(dong);
			totalRecord = dao.selectTotalCount(pagingVO);
			pagingVO.setTotalRecord(totalRecord);
		}
		
		if(!Objects.isNull(pagingVO)) {
			zipList = service.selectByZipcode(pagingVO);
			pagingVO.setData(zipList);
		}
		
		try(
			PrintWriter out = resp.getWriter();
		){
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(out, pagingVO);
		}
		
	}
}
