package org.atlas.flight.coredata.domain.language.service;

import org.atlas.flight.coredata.domain.language.dto.request.LanguageCreateRequest;
import org.atlas.flight.coredata.domain.language.entity.Language;

import java.util.List;

public interface LanguageService {
	List<Language> listActive();
	Language getByLanguageCd(String languageCd);
	void createLanguage(LanguageCreateRequest request);
}
