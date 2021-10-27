package com.skilldistillery.waves.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class BeachTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Beach beach;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAWaves");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		beach = em.find(Beach.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		beach = null;
	}

	@Test
	void test() {
		assertNotNull(beach);
		assertEquals("Lake Worth Municipal Beach", beach.getName());
	}
	@Test
	@DisplayName("Test One To One Location to Beach")
	void test2() {
		assertNotNull(beach);
		assertEquals("10 S Ocean Blvd", beach.getLocation().getStreet());
		assertEquals("33460", beach.getLocation().getZip());
	}

	@Test
	@DisplayName("testing mapping beach to beachSetting")
	void test_mapping_beach_setting_to_beach() {
		assertNotNull(beach);
		List<BeachSetting> beacheSettings = beach.getBeachSettings();
		assertNotNull(beacheSettings);
		assertTrue(beacheSettings.size() > 0);
		assertEquals("sandy", beacheSettings.get(0).getName());
		assertEquals("sandy with clear water", beacheSettings.get(0).getDescription());
		
	}

	@Test
	@DisplayName("testing mapping beach to inclementCondition")
	void test_mapping_inclement_condition_to_beach() {
		assertNotNull(beach);
		List<InclementCondition> inclementCondition = beach.getInclementConditions();
		assertNotNull(inclementCondition);
	}
}
