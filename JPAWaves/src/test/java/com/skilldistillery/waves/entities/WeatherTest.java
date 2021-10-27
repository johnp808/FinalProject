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

class WeatherTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Weather weather;

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
		weather = em.find(Weather.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		weather = null;
	}

	@Test
	void test() {
		assertNotNull(weather);
		assertEquals("sunny", weather.getWeatherType());
	}
	@Test
	void test_Weather_onetomany_weatherComments() {
		assertNotNull(weather);
		assertNotNull( weather.getWeatherComments());
		assertTrue(weather.getWeatherComments().size()>0);
		assertEquals(1, weather.getWeatherComments().size());
	}
	@Test
	void test_weather_manyToOne_User() {
		assertNotNull(weather);
		assertNotNull(weather.getUser());
		assertEquals(1, weather.getUser().getId());
	}
	@Test
	void test_weather_manyToOne_beach() {
		assertNotNull(weather);
		assertNotNull(weather.getBeach());
		assertEquals(1, weather.getBeach().getId());
	}

}
