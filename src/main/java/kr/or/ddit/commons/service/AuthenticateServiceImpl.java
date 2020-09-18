package kr.or.ddit.commons.service;

import java.util.Objects;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.member.dao.MemberDAOImpl;
import kr.or.ddit.vo.MemberVO;

public class AuthenticateServiceImpl implements IAuthenticateService{
	private IMemberDAO dao = MemberDAOImpl.getInstance();
	
	private static AuthenticateServiceImpl self;
	
	public static AuthenticateServiceImpl getInstance() {
		if(self==null)
			self = new AuthenticateServiceImpl();
		return self;
	}
	
	private AuthenticateServiceImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public Object authenticate(MemberVO member) {
		MemberVO savedMember = dao.selectMember(member.getMem_id());
		Object result = null;
		if(savedMember==null) {
			result = ServiceResult.NOTEXIST;
		}else {
			String inputPass = member.getMem_pass();
			String savedPass = savedMember.getMem_pass();
			if(savedPass.equals(inputPass)) {
				result = savedMember;
			}else {
				result = ServiceResult.INVALIDPASSWORD;
			}
		}
		return result;
	}

}
