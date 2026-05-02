package org.atlas.flight.coredata.domain.country.service.impl;

import lombok.RequiredArgsConstructor;
import org.atlas.flight.core.exception.ApiException;
import org.atlas.flight.core.message.ResponseCodeGeneral;
import org.atlas.flight.coredata.domain.country.dto.request.CountryCreateRequest;
import org.atlas.flight.coredata.domain.country.entity.Country;
import org.atlas.flight.coredata.domain.country.mapper.CountryMapper;
import org.atlas.flight.coredata.domain.country.repository.CountryRepository;
import org.atlas.flight.coredata.domain.country.service.CountryService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CountryImpl implements CountryService {
	private final CountryRepository countryRepository;
	private final CountryMapper countryMapper;

	@Override
	public List<Country> listActive() {
		return countryRepository.findByUseYnOrderByCountryCdAsc("Y");
	}

	@Override
	public Country getByCountryCd(String countryCd) {
		return countryRepository
				.findByCountryCd(countryCd)
				.orElseThrow(() -> new ApiException(ResponseCodeGeneral.NOT_FOUND));
	}

	@Override
	@Transactional
	public void createCountry(CountryCreateRequest request) {
		if (countryRepository.existsByCountryCd(request.getCountryCd()) || countryRepository.existsByCountryCd3(request.getCountryCd3())) {
			throw new ApiException(ResponseCodeGeneral.BAD_REQUEST);
		}
		countryRepository.save(countryMapper.toEntity(request));
	}
}
