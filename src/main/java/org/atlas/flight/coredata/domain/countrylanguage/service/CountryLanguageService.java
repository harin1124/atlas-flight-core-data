package org.atlas.flight.coredata.domain.countrylanguage.service;

import org.atlas.flight.coredata.domain.countrylanguage.dto.request.CountryLanguageCreateRequest;
import org.atlas.flight.coredata.domain.countrylanguage.entity.CountryLanguage;

import java.util.List;

public interface CountryLanguageService {
	List<CountryLanguage> listByCountryCd(String countryCd);
	CountryLanguage getCountryLanguage(String countryCd, String languageCd);
	void createCountryLanguage(CountryLanguageCreateRequest request);
}
