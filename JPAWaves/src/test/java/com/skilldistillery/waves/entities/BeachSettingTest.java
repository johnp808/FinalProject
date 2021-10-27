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

class BeachSettingTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private BeachSetting beachSetting;

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
		beachSetting = em.find(BeachSetting.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		beachSetting = null;
	}

	@Test
	void test() {
		assertNotNull(beachSetting);
		assertEquals("sandy", beachSetting.getName());
		assertEquals("sandy with clear water", beachSetting.getDescription());
	}

}
