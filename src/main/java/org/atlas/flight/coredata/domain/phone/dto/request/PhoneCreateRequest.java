package org.atlas.flight.coredata.domain.phone.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * [요청] 전화 국가 코드 등록
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "[요청] 전화 국가 코드 등록 (PhoneCreateRequest)")
public class PhoneCreateRequest {
	@NotBlank
	@Size(min = 2, max = 2)
	@Schema(description = "국가 코드 alpha-2", minLength = 2, maxLength = 2, example = "KR")
	private String countryCd;

	@NotBlank
	@Size(max = 10)
	@Schema(description = "전화 코드 (E.164, '+' 제외 숫자)", maxLength = 10, example = "82")
	private String phoneCd;

	@Size(max = 1)
	@Schema(description = "사용 여부", example = "Y")
	private String useYn;

	@Schema(description = "정렬 순서", example = "1")
	private int sortOrder;
}
