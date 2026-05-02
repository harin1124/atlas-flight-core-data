package org.atlas.flight.coredata.domain.countrylanguage.service.impl;

import lombok.RequiredArgsConstructor;
import org.atlas.flight.core.exception.ApiException;
import org.atlas.flight.core.message.ResponseCodeGeneral;
import org.atlas.flight.coredata.domain.countrylanguage.dto.request.CountryLanguageCreateRequest;
import org.atlas.flight.coredata.domain.countrylanguage.entity.CountryLanguage;
import org.atlas.flight.coredata.domain.countrylanguage.mapper.CountryLanguageMapper;
import org.atlas.flight.coredata.domain.countrylanguage.repository.CountryLanguageRepository;
import org.atlas.flight.coredata.domain.countrylanguage.service.CountryLanguageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CountryLanguageImpl implements CountryLanguageService {
	private final CountryLanguageRepository countryLanguageRepository;
	private final CountryLanguageMapper countryLanguageMapper;

	@Override
	public List<CountryLanguage> listByCountryCd(String countryCd) {
		return countryLanguageRepository.findByCountryCdAndDelYnOrderBySortOrderAsc(countryCd, "N");
	}

	@Override
	public CountryLanguage getCountryLanguage(String countryCd, String languageCd) {
		return countryLanguageRepository
				.findByCountryCdAndLanguageCd(countryCd, languageCd)
				.orElseThrow(() -> new ApiException(ResponseCodeGeneral.NOT_FOUND));
	}

	@Override
	@Transactional
	public void createCountryLanguage(CountryLanguageCreateRequest request) {
		if (countryLanguageRepository.existsByCountryCdAndLanguageCd(request.getCountryCd(), request.getLanguageCd())) {
			throw new ApiException(ResponseCodeGeneral.BAD_REQUEST);
		}
		countryLanguageRepository.save(countryLanguageMapper.toEntity(request));
	}
}
