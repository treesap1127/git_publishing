package kr.ac.kopo.movie_project.model;

public class Event {
	private int eventId;
	private String eventName;
	private String eventDate;
	private String eventInfo;
	private String id;
	private int eventViewcnt;
	private String startDate;
	private String endDate;
	private String endName;
	private String endInfo;
	
	
	public String getEndName() {
		return endName;
	}
	public void setEndName(String endName) {
		this.endName = endName;
	}
	public String getEndInfo() {
		return endInfo;
	}
	public void setEndInfo(String endInfo) {
		this.endInfo = endInfo;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getEventViewcnt() {
		return eventViewcnt;
	}
	public void setEventViewcnt(int eventViewcnt) {
		this.eventViewcnt = eventViewcnt;
	}
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	public String getEventInfo() {
		return eventInfo;
	}
	public void setEventInfo(String eventInfo) {
		this.eventInfo = eventInfo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
