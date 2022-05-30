package kr.ac.kopo.movie_project.model;

import kr.ac.kopo.movie_project.util.UploadFile;

public class EventImage implements UploadFile {
	private int fileId;
	private int eventId;
	private String filename;	
	private String uuid;
	

	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
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
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}



}
