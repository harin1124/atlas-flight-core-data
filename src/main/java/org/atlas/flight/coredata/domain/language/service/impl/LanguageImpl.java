package org.atlas.flight.coredata.domain.language.service.impl;

import lombok.RequiredArgsConstructor;
import org.atlas.flight.core.exception.ApiException;
import org.atlas.flight.core.message.ResponseCodeGeneral;
import org.atlas.flight.coredata.domain.language.dto.request.LanguageCreateRequest;
import org.atlas.flight.coredata.domain.language.entity.Language;
import org.atlas.flight.coredata.domain.language.mapper.LanguageMapper;
import org.atlas.flight.coredata.domain.language.repository.LanguageRepository;
import org.atlas.flight.coredata.domain.language.service.LanguageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LanguageImpl implements LanguageService {
	private final LanguageRepository languageRepository;
	private final LanguageMapper languageMapper;

	@Override
	public List<Language> listActive() {
		return languageRepository.findByUseYnOrderByLanguageCdAsc("Y");
	}

	@Override
	public Language getByLanguageCd(String languageCd) {
		return languageRepository
				.findByLanguageCd(languageCd)
				.orElseThrow(() -> new ApiException(ResponseCodeGeneral.NOT_FOUND));
	}

	@Override
	@Transactional
	public void createLanguage(LanguageCreateRequest request) {
		if (languageRepository.existsByLanguageCd(request.getLanguageCd())) {
			throw new ApiException(ResponseCodeGeneral.BAD_REQUEST);
		}
		if (StringUtils.hasText(request.getLanguageCd3()) && languageRepository.existsByLanguageCd3(request.getLanguageCd3())) {
			throw new ApiException(ResponseCodeGeneral.BAD_REQUEST);
		}
		languageRepository.save(languageMapper.toEntity(request));
	}
}
