package org.atlas.flight.coredata.domain.country.mapper;

import org.atlas.flight.coredata.domain.country.dto.request.CountryCreateRequest;
import org.atlas.flight.coredata.domain.country.entity.Country;
import org.springframework.stereotype.Component;

@Component
public class CountryMapper {
	public Country toEntity(CountryCreateRequest request) {
		return Country.createNew(
				request.getCountryCd(),
				request.getCountryCd3(),
				request.getCountryKorNm(),
				request.getCountryEngNm(),
				request.getNationalityKorNm(),
				request.getNationalityEngNm(),
				request.getRegionCd(),
				request.getUseYn()
		);
	}
}
