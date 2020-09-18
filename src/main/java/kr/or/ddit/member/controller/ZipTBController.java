package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.member.dao.IZipSearchDAO;
import kr.or.ddit.member.dao.ZipSearchDAOImpl;
import kr.or.ddit.vo.ZiptbVO;

@WebServlet("/searchZip.do")
public class ZipTBController extends HttpServlet{
	IZipSearchDAO dao = ZipSearchDAOImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*List<ZiptbVO> zipList = dao.selectByZipcode("");
		resp.setContentType("application/json;charset=UTF-8");
		try(
			PrintWriter out = resp.getWriter();	
		){
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(out, target);
		}*/
		
	}
}
