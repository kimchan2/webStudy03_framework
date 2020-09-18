package kr.or.ddit.member.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.vo.MemberVO;

public class MemberDAOImplTest2 {
	IMemberDAO dao;
	
	@Before
	public void setUp() throws Exception {
		dao = MemberDAOImpl.getInstance();
	}

//	@Test
	public void testInsertMember() {
		MemberVO member = MemberVO.builder()
				.mem_add1("대전")
				.mem_add2("대흥동")
				.mem_bir("1992-02-18")
				.mem_comtel("111-111-1111")
				.mem_delete("")
				.mem_hometel("222-222-2222")
				.mem_hp("333-333-3333")
				.mem_id("abc123")
				.mem_job("backsoo")
				.mem_like("책")
				.mem_mail("abc123@gamil.com")
				.mem_memorial("없음")
				.mem_memorialday("1992-02-18")
				.mem_mileage(0)
				.mem_name("죄웃성")
				.mem_pass("1q2w3e4r!")
				.mem_regno1("111111")
				.mem_regno2("2222222")
				.mem_zip("123-456")
				.build();
		dao.insertMember(member);
	}

//	@Test
	public void testSelectMemberList() {
		List<MemberVO> list = dao.selectMemberList();
		System.out.println(list);
		assertNotNull(list);
	}

//	@Test(timeout=2000) // 2초 이내에 실행이 완료돼야 한다는 뜻
	public void testSelectMember() {
		MemberVO member = dao.selectMember("a001");
		System.out.println(member);
		assertNotNull(member);
		member = dao.selectMember("qwdqwdqwdqwdqwd");
		assertNull(member);
	}

	@Test
	public void testUpdateMember() {
		MemberVO member = MemberVO.builder()
				.mem_add1("대전")
				.mem_add2("대흥동")
				.mem_bir("1992-02-18")
				.mem_comtel("111-111-1111")
				.mem_delete("")
				.mem_hometel("222-222-2222")
				.mem_hp("333-333-3333")
				.mem_id("abc123")
				.mem_job("backsoo")
				.mem_like("책")
				.mem_mail("abc123@gamil.com")
				.mem_memorial("없음")
				.mem_memorialday("1992-02-18")
				.mem_mileage(0)
				.mem_name("최웃성")
				.mem_pass("1q2w3e4r!")
				.mem_regno1("111111")
				.mem_regno2("2222222")
				.mem_zip("123-456")
				.build();
		dao.updateMember(member);
	}

//	@Test
	public void testDeleteMember() {
		dao.deleteMember("abc123");
	}

//	@Test
	public void testSelectByZipcode() {
		fail("Not yet implemented");
	}

}
