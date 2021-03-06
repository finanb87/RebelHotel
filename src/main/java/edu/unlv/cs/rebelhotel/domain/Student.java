package edu.unlv.cs.rebelhotel.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.persistence.Column;
import javax.validation.constraints.Size;

import java.util.Set;
import java.util.HashSet;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Transient;
import javax.persistence.TypedQuery;

import edu.unlv.cs.rebelhotel.domain.Term;
import edu.unlv.cs.rebelhotel.domain.WorkEffort;
import edu.unlv.cs.rebelhotel.form.FormStudent;

import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooEntity(finders = { "findStudentsByFirstNameEquals", "findStudentsByFirstNameLike", "findStudentsByUserAccount", "findStudentsByUserIdEquals" })
public class Student {

    @NotNull
    @Column(unique = true)
    private String userId;

    @NotNull
    @Size(min = 2)
    private String firstName;

    private String middleName;

    private String lastName;

    //@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE})
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Major> majors = new HashSet<Major>();

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    private Term admitTerm;

    @ManyToOne
    private Term gradTerm;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<WorkEffort> workEffort = new HashSet<WorkEffort>();

    private Boolean codeOfConductSigned;
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "S-")
    private Date lastModified;

    @OneToOne(optional = false, cascade= { CascadeType.PERSIST, CascadeType.REMOVE } )
    private UserAccount userAccount;
	
    @PreUpdate
    //@PrePersist
    public void onUpdate() {
    	lastModified = new Date();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("(" + userId + ")");
        sb.append(" " + firstName);
        if (lastName != null) {
            sb.append(" " + lastName);
        }
        return sb.toString();
    }

    public void addWorkEffort(WorkEffort we) {
        workEffort.add(we);
    }
    
    public String getName() {
    	String name = firstName;
    	if (lastName != null) {
    		name += " " + lastName;
    	}
    	return name;
    }
    
    public void updateMajors(Set<Major> newMajors){
    	if (isNewStudent()) {
    		addMajors(newMajors);
    	} else {
    		updateMajorsAsExistingStudent(newMajors);
    	}
    }
    
    private void updateMajorsAsExistingStudent(Set<Major> newMajors) {
		for (Major newMajor : newMajors) {
			if (!hasDeclaredMajor(newMajor)) {
				addMajor(newMajor);
			}
		}
	}

	private boolean hasDeclaredMajor(Major newMajor) {
		return getMajors().contains(newMajor);
	}

	public void addMajor(Major major) {
		Set<Major> majors = getMajors();
		majors.add(major);
		setMajors(majors);
	}

	private void addMajors(Set<Major> majors) {
		getMajors().addAll(majors);
	}

	/**
     * If the student has an empty set of majors, that means they are new to the system.
     * 
     * @return
     */
    @Transient
	public boolean isNewStudent() {
		return this.majors.isEmpty();
	}
    
    /**
     * This method creates a list of progress reports for each
     * of a given student's majors and returns this list as a
     * java set.
     * @return
     */
    public Set<Progress> calculateProgress(){
    	Set<Progress> progressSet = new HashSet<Progress>();    	
    	for(Major major : this.getMajors()){
    		Progress progress = new Progress(major,this.getWorkEffort());
    		progressSet.add(progress);
    	}
    	
    	return progressSet;
    }
    
    public String getEmail() {
    	return userAccount.getEmail();
    }
    
    public void setEmail(String email) {
    	userAccount.setEmail(email);
    	userAccount.merge();
    }
    
    public void copyFromFormStudent(FormStudent formStudent) {
    	setUserId(formStudent.getUserId());
    	setEmail(formStudent.getEmail());
    	setFirstName(formStudent.getFirstName());
    	setMiddleName(formStudent.getMiddleName());
    	setLastName(formStudent.getLastName());
    	setAdmitTerm(formStudent.getAdmitTerm());
    	setGradTerm(formStudent.getGradTerm());
    	setCodeOfConductSigned(formStudent.getCodeOfConductSigned());
    }
}
