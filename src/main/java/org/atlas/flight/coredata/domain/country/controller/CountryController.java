package org.atlas.flight.coredata.domain.country.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.atlas.flight.core.ApiResponse;
import org.atlas.flight.coredata.domain.country.dto.request.CountryCreateRequest;
import org.atlas.flight.coredata.domain.country.entity.Country;
import org.atlas.flight.coredata.domain.country.service.CountryService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/countries")
@RequiredArgsConstructor
@Tag(name = "국가 코드")
public class CountryController {
	private final CountryService countryService;

	@GetMapping
	@Operation(summary = "사용 중인 국가 코드 목록")
	public ApiResponse<List<Country>> listActive() {
		return ApiResponse.success(countryService.listActive());
	}

	@GetMapping("/{countryCd}")
	@Operation(summary = "국가 코드 단건 조회 (alpha-2)")
	public ApiResponse<Country> getByCountryCd(
			@Parameter(description = "국가 코드 alpha-2") @PathVariable String countryCd) {
		return ApiResponse.success(countryService.getByCountryCd(countryCd));
	}

	@PostMapping
	@Operation(summary = "국가 코드 등록")
	public ApiResponse<Void> createCountry(@Valid @RequestBody CountryCreateRequest request) {
		countryService.createCountry(request);
		return ApiResponse.success();
	}
}
