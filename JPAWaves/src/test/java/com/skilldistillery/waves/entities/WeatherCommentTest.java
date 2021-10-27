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

class WeatherCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private WeatherComment weatherComment;

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
		weatherComment = em.find(WeatherComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		weatherComment = null;
	}

	@Test
	void test() {
		assertNotNull(weatherComment);
		assertEquals("sunny and breezy", weatherComment.getComment());
	}
	@Test
	void test_oneTomany_comments() {
		assertNotNull(weatherComment);
		assertNotNull(weatherComment.getWeatherComments());
		assertTrue(weatherComment.getWeatherComments().size() > 0);
		assertEquals(1, weatherComment.getWeatherComments().size());

	}


}
