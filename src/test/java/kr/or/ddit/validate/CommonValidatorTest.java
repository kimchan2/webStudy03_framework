package kr.or.ddit.validate;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import kr.or.ddit.vo.MemberVO;

public class CommonValidatorTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		System.out.println("beforeClass"); // 테스트 실행전 한번
	}

	@Before
	public void setUp() throws Exception {
		System.out.println("before"); // 모든 테스트 케이스 실행전
	}

	// 테스트 케이스는 실행 순서가 없음!!!!! 중요!!!
	@Test
	public void testValidate() {
		MemberVO member = MemberVO.builder()
				.mem_hp("qwdqwdqwdqwdqwdqwdqwdqwdqwdwqdqwdqwdqwdq")
				.build();
		CommonValidator<MemberVO> validator = new CommonValidator<>();
		Map<String, StringBuffer> errors = new HashMap<>();
		boolean valid = validator.validate(member, errors, InsertGroup.class);
		if(!valid) {
			System.out.println(errors.get("mem_regno1"));
		}
	}
}
