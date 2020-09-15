package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.commons.service.AuthenticateServiceImpl;
import kr.or.ddit.commons.service.IAuthenticateService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.CustomException;
import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.member.dao.MemberDAOImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberServiceImpl implements IMemberService{
	private IMemberDAO memberDAO = MemberDAOImpl.getInstance();
	private IAuthenticateService authService = AuthenticateServiceImpl.getInstance();
	private static MemberServiceImpl self;
	
	public static MemberServiceImpl getInstance() {
		if(self==null)
			self = new MemberServiceImpl();
		return self;
	}
	
	private MemberServiceImpl() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public ServiceResult registMember(MemberVO member) {
		ServiceResult result = null;
		if(memberDAO.selectMember(member.getMem_id()) == null) {
			int chk = memberDAO.insertMember(member);
			if(chk > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}else {
			result = ServiceResult.PKDUPLICATED;
		}
		
		return result;
	}

	@Override
	public List<MemberVO> retrieveMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO retrieveMember(String mem_id) {
		MemberVO savedMember = memberDAO.selectMember(mem_id);
		if(savedMember==null) {
			throw new CustomException();
		}
		return savedMember;
	}

	@Override
	public ServiceResult modifyMember(MemberVO member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceResult removeMember(MemberVO member) {
		// TODO Auto-generated method stub
		return null;
	}

}
