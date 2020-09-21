package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.member.dao.MemberDAOImpl;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SearchVO;

@WebServlet("/member/memberList.do")
public class MemberListController extends HttpServlet{
	IMemberService service = MemberServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/member/memberList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		int currentPage = 1;
		PagingVO<MemberVO> pagingVO = new PagingVO<>();
		String page = req.getParameter("page");
		if(StringUtils.isNotBlank(page) && StringUtils.isNumeric(page)) {
			Integer pageInt = Integer.parseInt(page);
			currentPage = pageInt;
		}
		pagingVO.setCurrentPage(currentPage);
		
		String searchWord = req.getParameter("searchWord");
		String searchType = req.getParameter("searchType");
		
		if(StringUtils.isNotBlank(searchWord) && StringUtils.isNotBlank(searchType)) {
			SearchVO searchVO = SearchVO.builder()
					.searchType(searchType)
					.searchWord(searchWord).build();
			pagingVO.setSearchVO(searchVO);
		}
		int totalRecord = service.retrieveMemberCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<MemberVO> list = new ArrayList<>();
		Object obj = service.retrieveMemberList(pagingVO);
		if(obj instanceof List<?>) {
			list = (List<MemberVO>) obj;
		}
		
		pagingVO.setData(list);
		
		resp.setContentType("application/json;charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ObjectMapper mapper = new ObjectMapper();
		try(
				PrintWriter out = resp.getWriter();
				){
			mapper.writeValue(out, pagingVO);
		}
	}
}











