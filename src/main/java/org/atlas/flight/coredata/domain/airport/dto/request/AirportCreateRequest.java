package org.atlas.flight.coredata.domain.airport.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

/**
 * [요청] 공항 코드 등록
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "[요청] 공항 코드 등록 (AirportCreateRequest)")
public class AirportCreateRequest {
	@NotBlank
	@Size(min = 3, max = 3)
	@Schema(description = "IATA 코드", minLength = 3, maxLength = 3, example = "ICN")
	private String iataCd;

	@Size(min = 4, max = 4)
	@Schema(description = "ICAO 코드", minLength = 4, maxLength = 4, example = "RKSI")
	private String icaoCd;

	@NotBlank
	@Size(max = 100)
	@Schema(description = "공항 한국어 이름", maxLength = 100, example = "인천국제공항")
	private String airportKorNm;

	@NotBlank
	@Size(max = 100)
	@Schema(description = "공항 영어 이름", maxLength = 100, example = "Incheon International Airport")
	private String airportEngNm;

	@Size(max = 100)
	@Schema(description = "공항 현지어 이름", maxLength = 100)
	private String airportNatNm;

	@NotBlank
	@Size(min = 2, max = 2)
	@Schema(description = "국가 코드 alpha-2", minLength = 2, maxLength = 2, example = "KR")
	private String countryCd;

	@Size(max = 10)
	@Schema(description = "도시 코드", maxLength = 10)
	private String cityCd;

	@Schema(description = "위도 (WGS84)")
	private BigDecimal latitude;

	@Schema(description = "경도 (WGS84)")
	private BigDecimal longitude;

	@Size(max = 50)
	@Schema(description = "IANA 타임존", maxLength = 50, example = "Asia/Seoul")
	private String timezone;

	@NotBlank
	@Size(max = 10)
	@Schema(description = "공항 유형 코드 (D/I/B)", maxLength = 10, example = "I")
	private String airportTypeCd;

	@NotBlank
	@Size(max = 10)
	@Schema(description = "공항 상태 코드 (OP/CL/TC/CN)", maxLength = 10, example = "OP")
	private String airportStatCd;

	@Size(max = 1)
	@Schema(description = "사용 여부", example = "Y")
	private String useYn;
}
