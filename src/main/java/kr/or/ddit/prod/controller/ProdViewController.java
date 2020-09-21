package kr.or.ddit.prod.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.prod.service.IProdService;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.vo.ProdVO;

@WebServlet("/prod/prodView.do")
public class ProdViewController extends HttpServlet{
	IProdService service = new ProdService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String what = req.getParameter("what");
		ProdVO prodVO = new ProdVO();
		if(StringUtils.isNotBlank(what)) {
			prodVO = service.retrieveProd(what);
		}
		req.setAttribute("prodVO", prodVO);
		req.getRequestDispatcher("/WEB-INF/views/prod/prodView.jsp").forward(req, resp);
	}
}
