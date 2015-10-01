package uts.wsd;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "blogs")
public class Blogs implements Serializable {
	@XmlElement(name = "blog")
	private ArrayList<Blog> list = new ArrayList<Blog>();
	
	public ArrayList<Blog> getList() {
		return list;
	}
	
	public void resetList(ArrayList<Blog> originalBlogs, String email) {
		list.clear();
		for (Blog blog : originalBlogs) {
			if(blog.getEmail().equals(email))
				list.add(blog);
		}
	}
	
	public Blog getBlog(String email) {
		for(Blog blog : list)
			if(blog.getEmail().equals(email))
				return blog;
		return null;
	}
	
	public Blog getBlog(int id) {
		for(Blog blog : list)
			if(blog.getId() == id)
				return blog;
		return null;
	}
	
	public int getListSize() {
		return list.size();
	}
	
	public void removeBeforeDate(String startDate) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date blogDate;
		Date sDate = df.parse(startDate);
		
		Iterator<Blog> it = list.iterator();
		while(it.hasNext()) {
			blogDate = df.parse(it.next().getDate());
			if(blogDate.before(sDate))
				it.remove();
		}
	}
	
	public void removeAfterDate(String endDate) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date blogDate;
		Date eDate = df.parse(endDate);
		
		Iterator<Blog> it = list.iterator();
		while(it.hasNext()) {
			blogDate = df.parse(it.next().getDate());
			if(blogDate.after(eDate))
				it.remove();
		}
	}
	
	public void addBlog(Blog blog) {
		list.add(blog);
	}
	public void removeBlog(Blog blog) {
		list.remove(blog);
	}
	
	public void setBlogId() {
		int id = 1;
		for(Blog blog : list)
			blog.setId(id++);
	}
}
