package org.atlas.flight.coredata.domain.airport.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.atlas.flight.core.ApiResponse;
import org.atlas.flight.coredata.domain.airport.dto.request.AirportCreateRequest;
import org.atlas.flight.coredata.domain.airport.entity.Airport;
import org.atlas.flight.coredata.domain.airport.service.AirportService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/airports")
@RequiredArgsConstructor
@Tag(name = "공항 코드")
public class AirportController {
	private final AirportService airportService;

	@GetMapping
	@Operation(summary = "국가별 공항 코드 목록 (사용 중)")
	public ApiResponse<List<Airport>> listByCountryCd(
			@Parameter(description = "국가 코드 alpha-2") @RequestParam String countryCd) {
		return ApiResponse.success(airportService.listByCountryCd(countryCd));
	}

	@GetMapping("/{iataCd}")
	@Operation(summary = "공항 코드 단건 조회 (IATA)")
	public ApiResponse<Airport> getByIataCd(
			@Parameter(description = "IATA 코드") @PathVariable String iataCd) {
		return ApiResponse.success(airportService.getByIataCd(iataCd));
	}

	@PostMapping
	@Operation(summary = "공항 코드 등록")
	public ApiResponse<Void> createAirport(@Valid @RequestBody AirportCreateRequest request) {
		airportService.createAirport(request);
		return ApiResponse.success();
	}
}
