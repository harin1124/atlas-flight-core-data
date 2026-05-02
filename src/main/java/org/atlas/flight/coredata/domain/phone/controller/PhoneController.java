package org.atlas.flight.coredata.domain.phone.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.atlas.flight.core.ApiResponse;
import org.atlas.flight.coredata.domain.phone.dto.request.PhoneCreateRequest;
import org.atlas.flight.coredata.domain.phone.entity.Phone;
import org.atlas.flight.coredata.domain.phone.service.PhoneService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/phones")
@RequiredArgsConstructor
@Tag(name = "전화 국가 코드")
public class PhoneController {
	private final PhoneService phoneService;

	@GetMapping
	@Operation(summary = "국가별 전화 코드 목록 (사용 중)")
	public ApiResponse<List<Phone>> listByCountryCd(
			@Parameter(description = "국가 코드 alpha-2") @RequestParam String countryCd) {
		return ApiResponse.success(phoneService.listByCountryCd(countryCd));
	}

	@GetMapping("/{countryCd}/{phoneCd}")
	@Operation(summary = "전화 코드 단건 조회")
	public ApiResponse<Phone> getPhone(
			@Parameter(description = "국가 코드 alpha-2") @PathVariable String countryCd,
			@Parameter(description = "전화 코드") @PathVariable String phoneCd) {
		return ApiResponse.success(phoneService.getPhone(countryCd, phoneCd));
	}

	@PostMapping
	@Operation(summary = "전화 코드 등록")
	public ApiResponse<Void> createPhone(@Valid @RequestBody PhoneCreateRequest request) {
		phoneService.createPhone(request);
		return ApiResponse.success();
	}
}
