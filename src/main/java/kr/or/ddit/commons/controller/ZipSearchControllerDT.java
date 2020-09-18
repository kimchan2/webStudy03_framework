package kr.or.ddit.commons.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
import kr.or.ddit.member.service.IZipSearchService;
import kr.or.ddit.member.service.ZipSearchServiceImpl;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ZiptbVO;

@WebServlet("/zipSearchDT.do")
public class ZipSearchControllerDT extends HttpServlet{
	private IZipSearchService service = ZipSearchServiceImpl.getInstance();
	IZipSearchDAO dao = ZipSearchDAOImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String startParam = req.getParameter("start");
		String lengthParam = req.getParameter("length");
		
		int currentPage = 1;
		PagingVO<ZiptbVO> pagingVO = new PagingVO<>();
		int totalRecord = dao.selectTotalCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		if(StringUtils.isNotBlank(startParam) && StringUtils.isNumeric(startParam)
				&& StringUtils.isNotBlank(lengthParam) && StringUtils.isNumeric(lengthParam)) {
			int start = Integer.parseInt(startParam);
			int length = Integer.parseInt(lengthParam);
			currentPage = (start + length) / length;
			pagingVO.setScreenSize(length);
		}
		pagingVO.setCurrentPage(currentPage);
		
		List<ZiptbVO> zipList = new ArrayList<>();
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		
		String dong = req.getParameter("search[value]");
		if(StringUtils.isNotBlank(dong)) {
			pagingVO.setSearchWord(dong);
			pagingVO.setRecordsFiltered(dao.selectTotalCount(pagingVO));
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
