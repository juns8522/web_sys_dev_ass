package uts.wsd;
import javax.xml.bind.annotation.*;

import java.io.Serializable;

@XmlAccessorType(XmlAccessType.FIELD)
public class Blog implements Serializable {
	@XmlAttribute(name = "id")
	private int id;
	@XmlElement(name = "email")
	private String email;
	@XmlElement(name = "date")
	private String date;
	@XmlElement(name = "title")
	private String title;
	@XmlElement(name = "body")
	private String body;
	
	public Blog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Blog(int id, String email, String date, String title, String body) {
		super();
		this.id = id;
		this.email = email;
		this.date = date;
		this.title = title;
		this.body = body;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}
}
