package uts.wsd;

import java.io.Serializable;
import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;

@XmlAccessorType(XmlAccessType.FIELD)
public class User implements Serializable {
	@XmlElement(name = "email")
	private String email;
	@XmlElement(name = "password")
	private String password;
	@XmlElement(name = "name")
	private String name;
	@XmlElement(name = "description")
	private String description;
	@XmlElementWrapper(name = "friends")
	@XmlElement(name = "fEmail")
	private ArrayList<String> friends;
	@XmlElementWrapper(name = "request")
	@XmlElement(name = "rEmail")
	private ArrayList<String> requests;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String email, String password, String name, String description) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.description = description;
		friends = new ArrayList<String>();
		requests = new ArrayList<String>();
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public ArrayList<String> getFriends() {
		return friends;
	}
	public void addFriends(String fEmail) {
		friends.add(fEmail);
	}
	public ArrayList<String> getRequests() {
		return requests;
	}
	public void addRequest(String rEmail) {
		requests.add(rEmail);
	}
	public void removeRequest(String rEmail) {
		requests.remove(rEmail);
	}
	public void copyFields(User temp) {
		this.email = temp.getEmail();
		this.password = temp.getPassword();
		this.name = temp.getName();
		this.description = temp.getDescription();
	}
}
