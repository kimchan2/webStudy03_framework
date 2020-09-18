package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.validate.CommonValidator;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/leaveApp.do")
public class MemberDeleteController extends HttpServlet {
	IMemberService service = MemberServiceImpl.getInstance();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberVO member = (MemberVO) req.getSession().getAttribute("authMember");
		ServiceResult result = service.removeMember(member);
		String goPage = "";
		String message = "";
		boolean redirect = false;

		Map<String, StringBuffer> errors = new LinkedHashMap<>();
		req.setAttribute("errors", errors);
		CommonValidator<MemberVO> validator = new CommonValidator<>();
		boolean valid = validator.validate(member, errors, DeleteGroup.class);
		
		if (valid) {
			switch (result) {
			case INVALIDPASSWORD:
				goPage = req.getContextPath() + "/mypage.do";
				message = "비밀번호가 다릅니다. 확인 후 다시 넣으세요.";
				break;

			case FAILED:
				goPage = "/WEB-INF/views/member/registForm.jsp";
				message = "서버 문제로 탈퇴되지 않았습니다 잠시 후 다시 시도해주세요.";
				break;

			default:
				goPage = "/login/logout.do";
				redirect = true;
				break;
			}
		}
		else {
			goPage = "/WEB-INF/views/member/registForm.jsp";
			message = "서버 문제로 탈퇴되지 않았습니다 잠시 후 다시 시도해주세요.";
		}
		req.setAttribute("message", message);
		if(redirect) {
			resp.sendRedirect(req.getContextPath() + goPage);
		}else {
			req.getRequestDispatcher(goPage).forward(req, resp);
		}
	}
}
