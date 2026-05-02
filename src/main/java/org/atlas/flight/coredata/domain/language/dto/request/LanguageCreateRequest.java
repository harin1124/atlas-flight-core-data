package org.atlas.flight.coredata.domain.language.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * [요청] 언어 코드 등록
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "[요청] 언어 코드 등록 (LanguageCreateRequest)")
public class LanguageCreateRequest {
	@NotBlank
	@Size(min = 2, max = 2)
	@Schema(description = "언어 코드 ISO 639-1", minLength = 2, maxLength = 2, example = "ko")
	private String languageCd;

	@Size(min = 3, max = 3)
	@Schema(description = "언어 코드 ISO 639-2", minLength = 3, maxLength = 3, example = "kor")
	private String languageCd3;

	@NotBlank
	@Size(max = 100)
	@Schema(description = "언어 한국어 이름", maxLength = 100, example = "한국어")
	private String languageKorNm;

	@NotBlank
	@Size(max = 100)
	@Schema(description = "언어 영어 이름", maxLength = 100, example = "Korean")
	private String languageEngNm;

	@Size(max = 1)
	@Schema(description = "우좌쓰기 여부 (RTL)", example = "N")
	private String rtlYn;

	@Size(max = 1)
	@Schema(description = "사용 여부", example = "Y")
	private String useYn;
}
