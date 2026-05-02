package org.atlas.flight.coredata.domain.countrylanguage.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * [요청] 국가-언어 매핑 등록
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "[요청] 국가-언어 매핑 등록 (CountryLanguageCreateRequest)")
public class CountryLanguageCreateRequest {
	@NotBlank
	@Size(min = 2, max = 2)
	@Schema(description = "국가 코드 alpha-2", minLength = 2, maxLength = 2, example = "KR")
	private String countryCd;

	@NotBlank
	@Size(min = 2, max = 2)
	@Schema(description = "언어 코드 ISO 639-1", minLength = 2, maxLength = 2, example = "ko")
	private String languageCd;

	@Size(max = 1)
	@Schema(description = "공식어 여부", example = "Y")
	private String officialYn;

	@Size(max = 1)
	@Schema(description = "주요 언어 여부", example = "Y")
	private String primaryYn;

	@Schema(description = "정렬 순서", example = "1")
	private int sortOrder;

	@Size(max = 1)
	@Schema(description = "삭제 여부", example = "N")
	private String delYn;
}
