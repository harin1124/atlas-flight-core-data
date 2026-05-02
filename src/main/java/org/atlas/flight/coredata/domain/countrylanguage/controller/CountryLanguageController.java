package org.atlas.flight.coredata.domain.countrylanguage.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.atlas.flight.core.ApiResponse;
import org.atlas.flight.coredata.domain.countrylanguage.dto.request.CountryLanguageCreateRequest;
import org.atlas.flight.coredata.domain.countrylanguage.entity.CountryLanguage;
import org.atlas.flight.coredata.domain.countrylanguage.service.CountryLanguageService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/country-languages")
@RequiredArgsConstructor
@Tag(name = "국가-언어 매핑")
public class CountryLanguageController {
	private final CountryLanguageService countryLanguageService;

	@GetMapping
	@Operation(summary = "국가별 국가-언어 매핑 목록 (미삭제)")
	public ApiResponse<List<CountryLanguage>> listByCountryCd(
			@Parameter(description = "국가 코드 alpha-2") @RequestParam String countryCd) {
		return ApiResponse.success(countryLanguageService.listByCountryCd(countryCd));
	}

	@GetMapping("/{countryCd}/{languageCd}")
	@Operation(summary = "국가-언어 매핑 단건 조회")
	public ApiResponse<CountryLanguage> getCountryLanguage(
			@Parameter(description = "국가 코드 alpha-2") @PathVariable String countryCd,
			@Parameter(description = "언어 코드") @PathVariable String languageCd) {
		return ApiResponse.success(countryLanguageService.getCountryLanguage(countryCd, languageCd));
	}

	@PostMapping
	@Operation(summary = "국가-언어 매핑 등록")
	public ApiResponse<Void> createCountryLanguage(@Valid @RequestBody CountryLanguageCreateRequest request) {
		countryLanguageService.createCountryLanguage(request);
		return ApiResponse.success();
	}
}
