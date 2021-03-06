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

class UserTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test() {
		assertNotNull(user);
		assertEquals("cindy", user.getUsername());
	}
	@Test
	void test2() {
		assertNotNull(user);
		assertEquals("cindy", user.getUsername());
		assertEquals("lake worth", user.getLocation().getCity());
	}
	@Test
	void test3() {
		assertNotNull(user);
		assertNotNull( user.getBeachFavorites());
		assertTrue(user.getBeachFavorites().size()>0);
		assertEquals(1, user.getBeachFavorites().size());
	}
	}


