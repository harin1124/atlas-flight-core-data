package org.atlas.flight.coredata.domain.language.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.atlas.flight.core.ApiResponse;
import org.atlas.flight.coredata.domain.language.dto.request.LanguageCreateRequest;
import org.atlas.flight.coredata.domain.language.entity.Language;
import org.atlas.flight.coredata.domain.language.service.LanguageService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/languages")
@RequiredArgsConstructor
@Tag(name = "언어 코드")
public class LanguageController {
	private final LanguageService languageService;

	@GetMapping
	@Operation(summary = "사용 중인 언어 코드 목록")
	public ApiResponse<List<Language>> listActive() {
		return ApiResponse.success(languageService.listActive());
	}

	@GetMapping("/{languageCd}")
	@Operation(summary = "언어 코드 단건 조회 (ISO 639-1)")
	public ApiResponse<Language> getByLanguageCd(
			@Parameter(description = "언어 코드") @PathVariable String languageCd) {
		return ApiResponse.success(languageService.getByLanguageCd(languageCd));
	}

	@PostMapping
	@Operation(summary = "언어 코드 등록")
	public ApiResponse<Void> createLanguage(@Valid @RequestBody LanguageCreateRequest request) {
		languageService.createLanguage(request);
		return ApiResponse.success();
	}
}
