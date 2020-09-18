package kr.or.ddit.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@EqualsAndHashCode(of="zipcode")
public class ZiptbVO {
	private String zipcode;
	private String sido   ;
	private String gugun  ;
	private String dong   ;
	private String bunji  ;
	
	public String getAddress() {
		StringBuffer address = new StringBuffer();
		address.append(sido);
		address.append(" " + gugun);
		if(dong!=null) address.append(" " + dong);
		if(bunji!=null) address.append(" " + bunji);
		return address.toString();
	}
	
	/*totalRecord = 101
	totalPage 11 (totalRecord+screenSize-1)/screenSize
	blockSize 5
	currnetPage 클라이언트
	startPage =  endPage - (blockSize-1) 
	endPage = ((crrentPage+blockSize-1)/blockSize)*blockSize
	screenSize 10
	startRow = (currnetPage - 1) * screenSize + 1
	endRow = currnetPage * screenSize */
}
