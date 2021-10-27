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

class ReportCommentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ReportComment reportComment;

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
		reportComment = em.find(ReportComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		reportComment = null;
	}

	@Test
	void test() {
		assertNotNull(reportComment);
		assertEquals("lovely day!", reportComment.getComment());
		assertEquals(10, reportComment.getCommentDate().getMonthValue());
	}

}