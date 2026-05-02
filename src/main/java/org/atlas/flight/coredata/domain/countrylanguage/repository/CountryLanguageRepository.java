package org.atlas.flight.coredata.domain.countrylanguage.repository;

import org.atlas.flight.coredata.domain.countrylanguage.entity.CountryLanguage;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CountryLanguageRepository extends JpaRepository<CountryLanguage, Long> {

	List<CountryLanguage> findByCountryCdAndDelYnOrderBySortOrderAsc(String countryCd, String delYn);

	Optional<CountryLanguage> findByCountryCdAndLanguageCd(String countryCd, String languageCd);

	boolean existsByCountryCdAndLanguageCd(String countryCd, String languageCd);
}
