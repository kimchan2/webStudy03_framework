package kr.or.ddit.vo;

import java.io.Serializable;

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
}