package org.atlas.flight.coredata.domain.language.mapper;

import org.atlas.flight.coredata.domain.language.dto.request.LanguageCreateRequest;
import org.atlas.flight.coredata.domain.language.entity.Language;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Component
public class LanguageMapper {
	public Language toEntity(LanguageCreateRequest request) {
		return Language.createNew(
				request.getLanguageCd(),
				StringUtils.hasText(request.getLanguageCd3()) ? request.getLanguageCd3() : null,
				request.getLanguageKorNm(),
				request.getLanguageEngNm(),
				request.getRtlYn(),
				request.getUseYn()
		);
	}
}
