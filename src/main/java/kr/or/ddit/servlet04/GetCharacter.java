package kr.or.ddit.servlet04;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

@WebServlet("/getCharacter.do")
public class GetCharacter extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Map<String, String[]> bloodMap = (Map<String, String[]>) getServletContext().getAttribute("bloodMap");
		String name = req.getParameter("name");
		String msg = "";
		int statusCode = HttpServletResponse.SC_OK;
		
		if(StringUtils.isBlank(name)) {
			statusCode = HttpServletResponse.SC_BAD_REQUEST;
			msg = "필수 파라미터 누락";
		}else {
			if(!bloodMap.containsKey(name)) {
				statusCode = HttpServletResponse.SC_NOT_FOUND;
				msg = name + "은 존재하지 않습니다. ";
			}
		}
		if(statusCode != 200) {
			resp.sendError(statusCode, msg);
		}else {
			String[] bloodInfo = bloodMap.get(name);
			String url = bloodInfo[1];
			req.getRequestDispatcher(url).forward(req, resp);
//			resp.sendRedirect(req.getContextPath()+url);
		}
		
	}
	
}
