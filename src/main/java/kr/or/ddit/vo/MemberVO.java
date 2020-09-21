package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import javax.validation.groups.Default;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.validate.rule.PasswordCheck;
import kr.or.ddit.validate.rule.TelNumber;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Getter
//@Setter
/**
 * 한명의 회원 정보를 상세 조회할 때 그회원의 구매 상품 목록을 동시 조회.
 * 회원정보(MemberVO)
 * 상품정보(ProdVO)
 * 테이블 조인 결과 매핑 방법
 * 1. 각 테이블로부터 결과를 매핑할 각각의 VO 정의
 * 2. 테이블간의 관계를 반영하여 VO 간의 관계 모델링
 * 		1:N - has many
 * 		1:1 - has a
 * 3. resultType 대신 resultMap 사용.
 * 		1:N - collection (주의! 중복 제거를 위한 식별자 사용 ex)id )
 * 		1:1 - association
 *
 */
@EqualsAndHashCode(of = { "mem_id" })
@ToString(exclude = { "mem_regno1", "mem_regno2" })
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberVO implements Serializable {

	@Size(max = 15, groups= {Default.class, DeleteGroup.class})
	@NotBlank(groups= {Default.class, DeleteGroup.class})
	private String mem_id;
	@Size(max = 15, groups= {Default.class, DeleteGroup.class})
	@NotBlank(groups= {Default.class, DeleteGroup.class})
	private String mem_pass;
	@Size(max = 20)
	@NotBlank()
	private String mem_name;
	@Size(max = 6, groups=InsertGroup.class)
	@NotBlank(groups=InsertGroup.class)
	private String mem_regno1;
	@Size(max = 7, groups=InsertGroup.class)
	@NotBlank(groups=InsertGroup.class)
	private String mem_regno2;
	@Size(max = 10)
	private String mem_bir;
	@Size(max = 7)
	@NotBlank()
	private String mem_zip;
	@Size(max = 100)
	@NotBlank()
	private String mem_add1;
	@Size(max = 80)
	@NotBlank()
	private String mem_add2;
	@Size(max = 14)
	@NotBlank()
	@TelNumber
	private String mem_hometel;
	@Size(max = 14)
	@NotBlank()
	@TelNumber
	private String mem_comtel;
	@Size(max = 15)
	@TelNumber
	private String mem_hp;
	@Size(max = 40)
	@NotBlank()
	private String mem_mail;
	@Size(max = 40)
	private String mem_job;
	@Size(max = 40)
	private String mem_like;
	@Size(max = 40)
	private String mem_memorial;
	private String mem_memorialday;
	private Integer mem_mileage;
	private String mem_delete;
	
	private List<ProdVO> prodList; // has many 관계(1:N 관계의 테이블 조인시 사용되는 모델)
}