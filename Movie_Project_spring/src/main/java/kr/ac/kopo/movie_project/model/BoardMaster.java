package kr.ac.kopo.movie_project.model;

public class BoardMaster {
	private int boardId; //게시판번호
	private String subject; //게시판명
	private char reply; //댓글
	private char attach; //첨부파일
	private char secret; //회원전용
	private char permission; //권환
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public char getReply() {
		return reply;
	}
	public void setReply(char reply) {
		this.reply = reply;
	}
	public char getAttach() {
		return attach;
	}
	public void setAttach(char attach) {
		this.attach = attach;
	}
	public char getSecret() {
		return secret;
	}
	public void setSecret(char secret) {
		this.secret = secret;
	}
	public char getPermission() {
		return permission;
	}
	public void setPermission(char permission) {
		this.permission = permission;
	}
	
}
