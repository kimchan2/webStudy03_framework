package kr.or.ddit.vo;

import static org.junit.Assert.*;

import java.util.Locale;
import java.util.ResourceBundle;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Path;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.hibernate.validator.messageinterpolation.ResourceBundleMessageInterpolator;
import org.hibernate.validator.resourceloading.PlatformResourceBundleLocator;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.member.dao.MemberDAOImpl;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;

public class MemberVOValidationTest {
	private IMemberDAO dao;
	private static Validator validator;
	
	@BeforeClass
	public static void setUpClass() {
		ValidatorFactory factory = Validation.byDefaultProvider()
				.configure()
				.messageInterpolator(new ResourceBundleMessageInterpolator(
						new PlatformResourceBundleLocator("kr.or.ddit.msgs.CustomValidationMessage")
					)
				)
				.buildValidatorFactory();
		validator = factory.getValidator();
	}
	
	@Before
	public void setUp() throws Exception {
		dao = MemberDAOImpl.getInstance();
	}
	
//	@Test
	public void test() {
		MemberVO member = dao.selectMember("a001");
		assertNotNull(member);
		
	}
	
	@Test
	public void memberValidationTest() {
		MemberVO member = MemberVO.builder()
				.mem_hp("qwdqwdqwdw")
				.build();
		Set<ConstraintViolation<MemberVO>> errorSet = 
				validator.validate(member, InsertGroup.class);
		System.out.println(errorSet.size());
		for(ConstraintViolation<MemberVO> violation : errorSet) {
			Path propertyPath = violation.getPropertyPath();
			String message = violation.getMessage();
			System.out.printf("%s : %s\n", propertyPath, message);
		}
	}
	
//	@Test
	public void resourceBundleTest() {
		String baseName = "org.hibernate.validator.ValidationMessages"; // 로케일은 베이스네임에 포함되지않음
		ResourceBundle bundle = ResourceBundle.getBundle(baseName, Locale.JAPANESE);
		String message = bundle.getString("javax.validation.constraints.AssertFalse.message");
		System.out.println(message);
	}
}
