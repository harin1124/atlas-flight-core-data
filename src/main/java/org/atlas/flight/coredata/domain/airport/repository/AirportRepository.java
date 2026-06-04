package org.atlas.flight.coredata.domain.airport.repository;

import org.atlas.flight.coredata.domain.airport.entity.Airport;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface AirportRepository extends JpaRepository<Airport, Long> {

	List<Airport> findByCountry_CountryCdAndUseYnOrderByIataCdAsc(String countryCd, String useYn);

	Optional<Airport> findByIataCd(String iataCd);

	boolean existsByIataCd(String iataCd);

	boolean existsByIcaoCd(String icaoCd);
}
