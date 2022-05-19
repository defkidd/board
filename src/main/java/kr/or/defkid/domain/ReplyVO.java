package kr.or.defkid.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class ReplyVO {
	
	public int replyNo;
	public int boardNum;
	public String replyWriter;
	public String replyTitle;
	public String replyContent;
	public Date replyRegdate;
}
