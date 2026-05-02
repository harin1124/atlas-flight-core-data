package org.atlas.flight.coredata.domain.country.service;

import org.atlas.flight.coredata.domain.country.dto.request.CountryCreateRequest;
import org.atlas.flight.coredata.domain.country.entity.Country;

import java.util.List;

public interface CountryService {

	List<Country> listActive();

	Country getByCountryCd(String countryCd);

	void createCountry(CountryCreateRequest request);
}
