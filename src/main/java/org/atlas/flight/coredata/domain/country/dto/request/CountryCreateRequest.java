package org.atlas.flight.coredata.domain.country.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * [요청] 국가 코드 등록
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "[요청] 국가 코드 등록 (CountryCreateRequest)")
public class CountryCreateRequest {
	@NotBlank
	@Size(min = 2, max = 2)
	@Schema(description = "국가 코드 ISO 3166-1 alpha-2", minLength = 2, maxLength = 2, example = "KR")
	private String countryCd;

	@NotBlank
	@Size(min = 3, max = 3)
	@Schema(description = "국가 코드 ISO 3166-1 alpha-3", minLength = 3, maxLength = 3, example = "KOR")
	private String countryCd3;

	@NotBlank
	@Size(max = 100)
	@Schema(description = "국가 한국어 이름", maxLength = 100, example = "대한민국")
	private String countryKorNm;

	@NotBlank
	@Size(max = 100)
	@Schema(description = "국가 영어 이름", maxLength = 100, example = "Republic of Korea")
	private String countryEngNm;

	@Size(max = 100)
	@Schema(description = "국적 한국어 이름", maxLength = 100, example = "한국")
	private String nationalityKorNm;

	@Size(max = 100)
	@Schema(description = "국적 영어 이름", maxLength = 100, example = "South Korean")
	private String nationalityEngNm;

	@Size(max = 10)
	@Schema(description = "대륙 코드", maxLength = 10, example = "AS")
	private String regionCd;

	@Size(max = 1)
	@Schema(description = "사용 여부", example = "Y")
	private String useYn;
}
