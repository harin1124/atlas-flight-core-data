package org.atlas.flight.coredata.domain.code.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * [요청] 공통 코드 등록
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "[요청] 공통 코드 등록 (CommonCodeCreateRequest)")
public class CommonCodeCreateRequest {
	@NotBlank
	@Size(min = 1, max = 10)
	@Schema(description = "상위 코드", minLength = 1, maxLength = 10, example = "REGION")
	private String upCd;

	@NotBlank
	@Size(min = 1, max = 10)
	@Schema(description = "코드", minLength = 1, maxLength = 10, example = "AS")
	private String cd;

	@NotBlank
	@Size(min = 1, max = 50)
	@Schema(description = "코드 한국어 이름", minLength = 1, maxLength = 50, example = "아시아")
	private String cdKorNm;

	@Size(max = 100)
	@Schema(description = "코드 영문 이름", maxLength = 100, example = "Asia")
	private String cdEngNm;

	@Size(max = 300)
	@Schema(description = "설명", maxLength = 300)
	private String description;

	@NotNull
	@Schema(description = "정렬 순서", example = "1")
	private int sortOrder;

	@Size(max = 1)
	@Schema(description = "사용 여부", example = "Y")
	private String useYn;
}
