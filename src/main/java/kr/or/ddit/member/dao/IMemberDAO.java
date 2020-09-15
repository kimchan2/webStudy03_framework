package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.vo.MemberVO;

/**
 * 회원관리 Persistence Layer
 * CRUD
 */
public interface IMemberDAO {
	
	/**
	 * 회원 등록
	 * @param member
	 * @return 등록 성공(>0), 실패(==0)
	 */
	public int insertMember(MemberVO member);
	
	/**
	 * 회원 목록 조회
	 * @return
	 */
	public List<MemberVO> selectMemberList();
	
	/**
	 * 회원 상세 조회
	 * @param mem_id 조회할 PK
	 * @return 존재하지 않는 경우 null 반환
	 */
	public MemberVO selectMember(String mem_id);
	
	/**
	 * 회원 정보 수정(자기정보 수정)
	 * @param member
	 * @return 성공(>0), 실패(==0)
	 */
	public int updateMember(MemberVO member);
	
	/**
	 * 회원 정보 삭제(자기정보 삭제????)
	 * @param mem_id
	 * @return 성공(>0), 실패(==0)
	 */
	public int deleteMember(String mem_id);
}
