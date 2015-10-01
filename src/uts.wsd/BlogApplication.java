package uts.wsd;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;


public class BlogApplication implements Serializable {
	private String filePath;
	private Blogs blogs;
	public BlogApplication() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) throws JAXBException, IOException {
		this.filePath = filePath;
		// Create the unmarshaller
		JAXBContext jc = JAXBContext.newInstance(Blogs.class);
		Unmarshaller u = jc.createUnmarshaller();

		// Now unmarshal the object from the file
		FileInputStream fin = new FileInputStream(filePath);
		blogs = (Blogs)u.unmarshal(fin); // This loads the "shop" object
		fin.close();
	}
	public Blogs getBlogs() {
		return blogs;
	}
	public Blogs getBlogs(String email) {
		Blogs temp = new Blogs();
		temp.resetList(blogs.getList(), email);
		return temp;
	}
	public void setBlogs(Blogs blogs) {
		this.blogs = blogs;
	}
	public void setBlogsXml() throws JAXBException, FileNotFoundException
	{
		JAXBContext jc = JAXBContext.newInstance(Blogs.class);
		Marshaller m = jc.createMarshaller();
		m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		m.marshal(blogs, new FileOutputStream(filePath));
	}
}
