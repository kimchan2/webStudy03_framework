package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/member/memberView.do")
public class MemberViewController extends HttpServlet{
   IMemberService service = MemberServiceImpl.getInstance();
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.setCharacterEncoding("UTF-8");
      String who = req.getParameter("who");
      
      if(StringUtils.isBlank(who)) {
         resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "회원 정보 없음");
         return;
      }
      
      MemberVO authMember = service.retrieveMember(who);
      req.setAttribute("member", authMember);
      String goPage = "/WEB-INF/views/member/memberView.jsp";
      req.getRequestDispatcher(goPage).forward(req, resp);
   }
}