package kr.or.defkid.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Setter
@Getter
@ToString  /* list페이지로 처음 올때는 Default 값이 필요 */
@Slf4j
public class PageCondDTO {
	private int pageNum;
	private int pageSize;
	private int pageRange;
	
	//Default생성자를 이용해서 초기값 할당
	public PageCondDTO() {
		this(1,10,10);
	}

	public PageCondDTO(int pageNum,int pageSize,int pageRange) {
		this.pageNum = pageNum;
		this.pageSize= pageSize;
		this.pageRange = pageRange;
	}


}









