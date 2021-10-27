package com.skilldistillery.waves.entities;

import static org.junit.jupiter.api.Assertions.*;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ReportTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Report report;

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
		report = em.find(Report.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		report = null;
	}

	@Test
	void test() {
		assertNotNull(report);
		assertEquals("A good family beach", report.getComment());
		assertEquals(3, report.getRating());
	}
	
	@Test
	void test_report_ManyToOne_beach_mapping() {
		assertNotNull(report);
		assertEquals("Lake Worth Municipal Beach", report.getBeach().getName());
	}
	
	@Test
	void test_report_ManyToOne_user_mapping() {
		assertNotNull(report);
		assertEquals("cindy", report.getUser().getUsername());
	}
	
	@Test
	void test_report_OneToMany_reportComment_mapping() {
		assertNotNull(report);
		assertTrue(report.getComments().size() > 0);
	}

}
