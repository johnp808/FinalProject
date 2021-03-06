package com.skilldistillery.waves.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

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

class InclementConditionTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private InclementCondition inclementCondition;

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
		inclementCondition = em.find(InclementCondition.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		inclementCondition = null;
	}

	@Test
	void test() {
		assertNotNull(inclementCondition);
		assertEquals("hurrican season", inclementCondition.getName());
	}
	
	@Test
	@DisplayName("test mapping inclementCondition to beach")
	void test_inclement_condition_to_beach() {
		assertNotNull(inclementCondition);
		List<Beach> beaches = inclementCondition.getBeaches();
		assertNotNull(beaches);
		assertTrue(beaches.size() > 0);
		assertEquals("Ocean Ridge Hammock Park",beaches.get(0).getName());
	}

}
