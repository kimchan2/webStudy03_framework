package kr.or.ddit.commons.service;

import java.util.Objects;

import kr.or.ddit.commons.dao.AuthenticateDAOImpl;
import kr.or.ddit.commons.dao.IAuthenticateDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.MemberVO;

public class AuthenticateServiceImpl implements IAuthenticateService{
	private IAuthenticateDAO iad = AuthenticateDAOImpl.getInstance();
	
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
		MemberVO savedMember = iad.selectMember(member);
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
