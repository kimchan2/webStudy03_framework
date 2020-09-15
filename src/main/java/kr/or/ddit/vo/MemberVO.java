package kr.or.ddit.vo;

import java.io.Serializable;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import kr.or.ddit.validate.rule.PasswordCheck;
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
@EqualsAndHashCode(of= {"mem_id"})
@ToString(exclude= {"mem_regno1", "mem_regno2"})
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberVO implements Serializable{
   
   @NotBlank
   @Size(max=15)
   private String mem_id;
   @NotBlank
   @PasswordCheck
   private String mem_pass;
   @NotBlank
   private String mem_name;
   @NotBlank
   private String mem_regno1;
   private String mem_regno2;
   private String mem_bir;
   private String mem_zip;
   private String mem_add1;
   private String mem_add2;
   private String mem_hometel;
   private String mem_comtel;
   private String mem_hp;
   @Email
   private String mem_mail;
   private String mem_job;
   private String mem_like;
   private String mem_memorial;
   private String mem_memorialday;
   private int mem_mileage;
   private String mem_delete;
}