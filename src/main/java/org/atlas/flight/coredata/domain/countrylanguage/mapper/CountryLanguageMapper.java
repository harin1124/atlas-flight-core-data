package org.atlas.flight.coredata.domain.countrylanguage.mapper;

import org.atlas.flight.coredata.domain.countrylanguage.dto.request.CountryLanguageCreateRequest;
import org.atlas.flight.coredata.domain.countrylanguage.entity.CountryLanguage;
import org.springframework.stereotype.Component;

@Component
public class CountryLanguageMapper {
	public CountryLanguage toEntity(CountryLanguageCreateRequest request) {
		return CountryLanguage.createNew(
				request.getCountryCd(),
				request.getLanguageCd(),
				request.getOfficialYn(),
				request.getPrimaryYn(),
				request.getSortOrder(),
				request.getDelYn()
		);
	}
}
