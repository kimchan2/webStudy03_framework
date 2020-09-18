package kr.or.ddit.member.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.vo.ZiptbVO;

public class MemberDAOImplTest {
	IZipSearchDAO dao;
	
	@Before
	public void setUp() throws Exception {
		dao = ZipSearchDAOImpl.getInstance();
	}

//	@Test
//	public void testSelectByZipcode() {
//		List<ZiptbVO> zipList = dao.selectByZipcode("대흥동");
//		System.out.println(zipList);
//		assertNull(zipList);
//		assertNotEquals(0, zipList.size());
//	}

}
