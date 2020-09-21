package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PagingVO<T> implements Serializable{
	
	private PagingVO(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}

	private int totalRecord;
	private int currentPage;
	private int screenSize=3;
	private int blockSize=5;
	
	private int totalPage;
	private int startRow;
	private int endRow;
	private int startPage;
	private int endPage;
	
	private int recordsTotal;
	private int recordsFiltered;
	
	private SearchVO searchVO;
	
	private List<T> data;
	
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		totalPage = (totalRecord+screenSize-1)/screenSize;
		recordsTotal = totalRecord;
		recordsFiltered = totalRecord;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		endRow = currentPage * screenSize;
		startRow = (currentPage - 1) * screenSize + 1;
		
		endPage = ((currentPage+blockSize-1)/blockSize)*blockSize;
		startPage =  endPage - (blockSize-1);
	}
	
	private final String PATTERN = "<a href='#' data-page='%d' class='%s'>%s</a>";
	public String getPagingHTML() {
		StringBuffer html = new StringBuffer();
		
		endPage = totalPage<endPage?totalPage:endPage;
		if(startPage > blockSize) {
			html.append(String.format(PATTERN, (startPage-blockSize), "previous", "이전"));
		}
		for(int page=startPage; page <= endPage; page++) {
			if(currentPage==page) {
				html.append(String.format(PATTERN, page, "current", page));
			}else {
				html.append(String.format(PATTERN, page, "", page));
			}
		}
		if(endPage < totalPage) {
			html.append(String.format(PATTERN, (endPage+1), "next", "다음"));
		}
		
		return html.toString();
	}
	
	private final String BSPATTERN = "<li class='page-item'><a data-page='%s' class='page-link %s' href='#'>%s</a></li>";
	public String getPagingHTML_BS() {
		StringBuffer bs = new StringBuffer();
		bs.append("<nav aria-label='Page navigation example'>");
		bs.append("<ul class='pagination'>");
		
		endPage = totalPage<endPage?totalPage:endPage;
		if(startPage > blockSize) {
			bs.append(String.format(BSPATTERN, (startPage-blockSize), "Previous", "이전"));
		}
		for(int page=startPage; page <= endPage; page++) {
			if(currentPage==page) {
				bs.append(String.format(BSPATTERN, page, "current", page));
			}else {
				bs.append(String.format(BSPATTERN, page, "", page));
			}
		}
		if(endPage < totalPage) {
			bs.append(String.format(BSPATTERN, (endPage+1), "Next", "다음"));
		}
		
		bs.append("</ul>");
		bs.append("</nav>");
		
		return bs.toString();
	}
}
