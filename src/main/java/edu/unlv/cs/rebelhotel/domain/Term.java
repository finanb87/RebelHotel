package edu.unlv.cs.rebelhotel.domain;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import edu.unlv.cs.rebelhotel.domain.enums.Semester;

import javax.persistence.Enumerated;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@RooJavaBean
@RooToString
@Table(uniqueConstraints = { @UniqueConstraint(columnNames = { "semester", "termYear" }) })
@RooEntity(finders = { "findTermsBySemester", "findTermsBySemesterAndTermYearEquals" })
public class Term {

	private static final Logger LOG = LoggerFactory.getLogger(Term.class);
	
    @NotNull
    private Integer termYear;

    @Enumerated
    private Semester semester;

    public Term(Integer termYear, Semester semester) {
        this.termYear = termYear;
        this.semester = semester;
    }

    public Term() {
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getSemester() + " " + getTermYear());
        return sb.toString();
    }
    
    @PrePersist
    public void createNewTerm() {
    	LOG.debug("Created new term: " + toString());
    }
}
