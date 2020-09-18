package kr.or.ddit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.ibatis.reflection.wrapper.BeanWrapper;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

@WebServlet("/myDataUpdate.do")
public class MemberUpdateController extends HttpServlet{
	private IMemberService service = MemberServiceImpl.getInstance();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
//		1. 요청 파라미터 획득
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		MemberVO member = new MemberVO();
		req.setAttribute("member", member);
		Map<String, String[]> parameterMap = req.getParameterMap();
		try {
			BeanUtils.populate(member, parameterMap);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ServiceResult result = service.modifyMember(member);
		MemberVO authMember = (MemberVO) session.getAttribute("authMember");
		try {
			String mem_id = authMember.getMem_id();
			String mem_name =  authMember.getMem_name();
			String mem_regno1 =  authMember.getMem_regno1();
			String mem_regno2 =  authMember.getMem_regno2();
			String mem_bir =  authMember.getMem_bir();
			Integer mem_mileage =  authMember.getMem_mileage();
			String mem_delete =  authMember.getMem_delete();
			
			BeanUtils.copyProperties(authMember, member);
			
			authMember.setMem_id(mem_id);
			authMember.setMem_name(mem_name);
			authMember.setMem_regno1(mem_regno1);
			authMember.setMem_regno2(mem_regno2);
			authMember.setMem_bir(mem_bir);
			authMember.setMem_mileage(mem_mileage);
			authMember.setMem_delete(mem_delete);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 최신 수정 정보로 authMember 업데이트(카피)
		
		Map<String, String> map = new LinkedHashMap<>();
		map.put("result", result.name());
		PrintWriter out = resp.getWriter();
		ObjectMapper mapper = new ObjectMapper();
		
		mapper.writeValue(out, map);
	}
}
