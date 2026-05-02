package org.atlas.flight.coredata.domain.country.repository;

import org.atlas.flight.coredata.domain.country.entity.Country;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CountryRepository extends JpaRepository<Country, Long> {

	List<Country> findByUseYnOrderByCountryCdAsc(String useYn);

	Optional<Country> findByCountryCd(String countryCd);

	boolean existsByCountryCd(String countryCd);

	boolean existsByCountryCd3(String countryCd3);
}
