package kr.or.defkid.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/* 페이지 범위 산수 모음 클래스 */
@ToString
@Getter
public class PageDTO {
	private int total;
	private int startPage;
	private int endPage;
	private boolean Previous=true;
	private boolean Next=true;
	private PageCondDTO pageCondDTO;
	
	public PageDTO(PageCondDTO pageCondDTO, int total) {
		this.pageCondDTO = pageCondDTO;
		// 일단 한 화면에 1.....10  이런식으로 페이지가 10개씩 나타나야 한다고 가정
		// 그리고 항상 endPage는 데이터 갯수가 딱 안 떨어질수 있어서 신경써야 함.
		int realEndPage = (int)Math.ceil(total/(double)pageCondDTO.getPageRange());
		this.endPage = (int)Math.ceil(pageCondDTO.getPageNum() / (double)pageCondDTO.getPageRange())*pageCondDTO.getPageRange();
		if (this.endPage >= realEndPage) {
			this.Next = false;
			this.endPage = realEndPage;
		}
		this.startPage = this.endPage - 9;
		if (this.startPage <= 1) {
			this.Previous=false;
			this.startPage =1;
		}
		if (this.endPage%10!=0) {
			this.startPage=this.endPage-(this.endPage%10)+1;
		}
		this.total=total;
	}
	
}
