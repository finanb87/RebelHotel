// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package edu.unlv.cs.rebelhotel.domain;

import edu.unlv.cs.rebelhotel.domain.MajorDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MajorIntegrationTest_Roo_IntegrationTest {
    
    declare @type: MajorIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: MajorIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: MajorIntegrationTest: @Transactional;
    
    @Autowired
    private MajorDataOnDemand MajorIntegrationTest.dod;
    
    @Test
    public void MajorIntegrationTest.testCountMajors() {
        org.junit.Assert.assertNotNull("Data on demand for 'Major' failed to initialize correctly", dod.getRandomMajor());
        long count = edu.unlv.cs.rebelhotel.domain.Major.countMajors();
        org.junit.Assert.assertTrue("Counter for 'Major' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void MajorIntegrationTest.testFindMajor() {
        edu.unlv.cs.rebelhotel.domain.Major obj = dod.getRandomMajor();
        org.junit.Assert.assertNotNull("Data on demand for 'Major' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Major' failed to provide an identifier", id);
        obj = edu.unlv.cs.rebelhotel.domain.Major.findMajor(id);
        org.junit.Assert.assertNotNull("Find method for 'Major' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Major' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void MajorIntegrationTest.testFindAllMajors() {
        org.junit.Assert.assertNotNull("Data on demand for 'Major' failed to initialize correctly", dod.getRandomMajor());
        long count = edu.unlv.cs.rebelhotel.domain.Major.countMajors();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Major', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<edu.unlv.cs.rebelhotel.domain.Major> result = edu.unlv.cs.rebelhotel.domain.Major.findAllMajors();
        org.junit.Assert.assertNotNull("Find all method for 'Major' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Major' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void MajorIntegrationTest.testFindMajorEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Major' failed to initialize correctly", dod.getRandomMajor());
        long count = edu.unlv.cs.rebelhotel.domain.Major.countMajors();
        if (count > 20) count = 20;
        java.util.List<edu.unlv.cs.rebelhotel.domain.Major> result = edu.unlv.cs.rebelhotel.domain.Major.findMajorEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Major' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Major' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void MajorIntegrationTest.testFlush() {
        edu.unlv.cs.rebelhotel.domain.Major obj = dod.getRandomMajor();
        org.junit.Assert.assertNotNull("Data on demand for 'Major' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Major' failed to provide an identifier", id);
        obj = edu.unlv.cs.rebelhotel.domain.Major.findMajor(id);
        org.junit.Assert.assertNotNull("Find method for 'Major' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyMajor(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Major' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void MajorIntegrationTest.testMerge() {
        edu.unlv.cs.rebelhotel.domain.Major obj = dod.getRandomMajor();
        org.junit.Assert.assertNotNull("Data on demand for 'Major' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Major' failed to provide an identifier", id);
        obj = edu.unlv.cs.rebelhotel.domain.Major.findMajor(id);
        boolean modified =  dod.modifyMajor(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        edu.unlv.cs.rebelhotel.domain.Major merged = (edu.unlv.cs.rebelhotel.domain.Major) obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Major' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void MajorIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Major' failed to initialize correctly", dod.getRandomMajor());
        edu.unlv.cs.rebelhotel.domain.Major obj = dod.getNewTransientMajor(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Major' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Major' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Major' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void MajorIntegrationTest.testRemove() {
        edu.unlv.cs.rebelhotel.domain.Major obj = dod.getRandomMajor();
        org.junit.Assert.assertNotNull("Data on demand for 'Major' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Major' failed to provide an identifier", id);
        obj = edu.unlv.cs.rebelhotel.domain.Major.findMajor(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Major' with identifier '" + id + "'", edu.unlv.cs.rebelhotel.domain.Major.findMajor(id));
    }
    
}