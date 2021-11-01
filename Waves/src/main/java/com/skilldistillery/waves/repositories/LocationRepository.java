package com.skilldistillery.waves.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.skilldistillery.waves.entities.Location;

public interface LocationRepository extends JpaRepository<Location, Integer> {

}
