package uts.wsd.soap.client;

import java.rmi.RemoteException;
import java.util.Scanner;

import javax.xml.rpc.ServiceException;



public class BlogClient {

	public static void main(String[] args) throws ServiceException, RemoteException {
		// TODO Auto-generated method stub
		BlogSOAPServiceLocator locator = new BlogSOAPServiceLocator();
		BlogSOAP blogsoap = locator.getBlogSOAPPort();
	
		//insert code for user to see a list of his own blogs
		//and to also delete a blog.
		Scanner scan = new Scanner(System.in);
		System.out.print("Enter email address: ");
		String email = scan.nextLine();
		Blog[] blogs = blogsoap.fetch(email);
		while(blogs != null)
		{
			System.out.println("blogId		" + 	"blog Title		"	+	"		blog Body	");
			for(Blog blog : blogs)
				System.out.println(blog.getDate() + "     "  + blog.getTitle() + "     " + blog.getBody());
			
			System.out.print("Enter email address: ");
			email = scan.nextLine();
			blogs = blogsoap.fetch(email);
		}
		System.out.println("No such user found.");
	
	}
}
