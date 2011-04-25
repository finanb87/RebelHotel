package edu.unlv.cs.rebelhotel.service;

<<<<<<< HEAD
//import org.springframework.transaction.annotation.Transactional;

import edu.unlv.cs.rebelhotel.domain.Student;

//@Transactional
public class UserInformation {
=======
import java.io.Serializable;

import edu.unlv.cs.rebelhotel.domain.Student;

public class UserInformation implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 327275037034671906L;
>>>>>>> 63e7d7249c867f0c29ea9c8db2017aeb0ee90cb9
	private Student student;
	
	public Student getStudent() {
		return student;
	}
	
	public void setStudent(Student student) {
		this.student = student;
	}
}