package org.atlas.flight.coredata.domain.code.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.atlas.flight.core.ApiResponse;
import org.atlas.flight.coredata.domain.code.dto.request.CommonCodeCreateRequest;
import org.atlas.flight.coredata.domain.code.entity.CommonCode;
import org.atlas.flight.coredata.domain.code.service.CommonCodeService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/common-codes")
@RequiredArgsConstructor
@Tag(name = "공통 코드")
public class CommonCodeController {
	private final CommonCodeService commonCodeService;

	@GetMapping
	@Operation(summary = "상위 코드별 공통 코드 목록")
	public ApiResponse<List<CommonCode>> listByUpCd(@Parameter(description = "상위 코드") @RequestParam String upCd) {
		return ApiResponse.success(commonCodeService.listByUpCd(upCd));
	}

	@GetMapping("/{upCd}/{cd}")
	@Operation(summary = "공통 코드 단건 조회")
	public ApiResponse<CommonCode> getCommonCode(
			@Parameter(description = "상위 코드") @PathVariable String upCd,
			@Parameter(description = "코드") @PathVariable String cd) {
		return ApiResponse.success(commonCodeService.getCommonCode(upCd, cd));
	}

	@PostMapping
	@Operation(summary = "공통 코드 등록")
	public ApiResponse<Void> createCommonCode(@Valid @RequestBody CommonCodeCreateRequest request) {
		commonCodeService.createCommonCode(request);
		return ApiResponse.success();
	}
}
