package kr.ac.kopo.movie_project.model;

import kr.ac.kopo.movie_project.util.UploadFile;

public class EventImage implements UploadFile {
	private int code;	
	private String filename;	
	private String UUID;
	private int eventId;
	
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getUUID() {
		return UUID;
	}
	public void setUUID(String uUID) {
		UUID = uUID;
	}



}
