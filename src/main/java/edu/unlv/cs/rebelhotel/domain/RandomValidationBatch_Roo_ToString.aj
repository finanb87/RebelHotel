// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package edu.unlv.cs.rebelhotel.domain;

import java.lang.String;

privileged aspect RandomValidationBatch_Roo_ToString {
    
    public String RandomValidationBatch.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Batch_number: ").append(getBatch_number()).append(", ");
        sb.append("Batch_run_date: ").append(getBatch_run_date()).append(", ");
        sb.append("Num_pending: ").append(getNum_pending()).append(", ");
        sb.append("Num_validated: ").append(getNum_validated()).append(", ");
        sb.append("Num_failed_validation: ").append(getNum_failed_validation()).append(", ");
        sb.append("Num_no_validation: ").append(getNum_no_validation()).append(", ");
        sb.append("Sample_size: ").append(getSample_size()).append(", ");
        sb.append("Students: ").append(getStudents() == null ? "null" : getStudents().size());
        return sb.toString();
    }
    
}
