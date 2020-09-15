package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.exception.CustomException;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/idCheck.do")
public class IdCheckController extends HttpServlet{
	IMemberService service = MemberServiceImpl.getInstance();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json;charset=UTF-8");
		int sc = HttpServletResponse.SC_OK;
		
		// inputId 파라미터 획득
		String inputId = req.getParameter("inputId");
		// null 체크, 없으면 400
		if(StringUtils.isBlank(inputId)) {
			sc = HttpServletResponse.SC_BAD_REQUEST;
			resp.sendError(sc);
			return;
		}
		
		// 있으면 service로
		boolean validId = false;
		try{
			service.retrieveMember(inputId);
		}catch (CustomException e) {
			validId = true;
		}
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("valid", validId);
		if(!validId) {resultMap.put("useId", "추천아이디");}
		ObjectMapper mapper = new ObjectMapper();
		try(PrintWriter out = resp.getWriter();){
			mapper.writeValue(out, resultMap);
		}
		
		/*MemberVO member = service.retrieveMember(inputId);
		Map<String, String> result = new HashMap<>();
		if(member == null) {
			// 없으면 중복아님		
			result.put("success", "yes");
			result.put("message", "사용 가능한 아이디입니다.");
		}else {
			// 멤버가 있으면 중복
			result.put("success", "no");
			result.put("message", "사용 불가능한 아이디입니다. 다른 아이디를 입력해주세요.");
		}
		ObjectMapper mapper = new ObjectMapper();
		PrintWriter out = resp.getWriter();
		mapper.writeValue(out, result);*/
		
	}
}
