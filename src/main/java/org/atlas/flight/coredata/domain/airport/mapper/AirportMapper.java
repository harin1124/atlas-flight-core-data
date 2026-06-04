package org.atlas.flight.coredata.domain.airport.mapper;

import lombok.RequiredArgsConstructor;
import org.atlas.flight.core.exception.ApiException;
import org.atlas.flight.core.message.ResponseCodeGeneral;
import org.atlas.flight.coredata.domain.airport.dto.request.AirportCreateRequest;
import org.atlas.flight.coredata.domain.airport.entity.Airport;
import org.atlas.flight.coredata.domain.code.entity.CommonCodeId;
import org.atlas.flight.coredata.domain.code.repository.CommonCodeRepository;
import org.atlas.flight.coredata.domain.country.repository.CountryRepository;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Component
@RequiredArgsConstructor
public class AirportMapper {
	private static final String UP_CD_AIRPORT_TYPE = "AIRPORT_TYPE";
	private static final String UP_CD_AIRPORT_STAT = "AIRPORT_STAT";

	private final CountryRepository countryRepository;
	private final CommonCodeRepository commonCodeRepository;

	public Airport toEntity(AirportCreateRequest request) {
		return Airport.createNew(
				request.getIataCd(),
				StringUtils.hasText(request.getIcaoCd()) ? request.getIcaoCd() : null,
				request.getAirportKorNm(),
				request.getAirportEngNm(),
				StringUtils.hasText(request.getAirportNatNm()) ? request.getAirportNatNm() : null,
				countryRepository
						.findByCountryCd(request.getCountryCd())
						.orElseThrow(() -> new ApiException(ResponseCodeGeneral.NOT_FOUND)),
				StringUtils.hasText(request.getCityCd()) ? request.getCityCd() : null,
				request.getLatitude(),
				request.getLongitude(),
				StringUtils.hasText(request.getTimezone()) ? request.getTimezone() : null,
				commonCodeRepository
						.findById(new CommonCodeId(UP_CD_AIRPORT_TYPE, request.getAirportTypeCd()))
						.orElseThrow(() -> new ApiException(ResponseCodeGeneral.NOT_FOUND)),
				commonCodeRepository
						.findById(new CommonCodeId(UP_CD_AIRPORT_STAT, request.getAirportStatCd()))
						.orElseThrow(() -> new ApiException(ResponseCodeGeneral.NOT_FOUND)),
				request.getUseYn()
		);
	}
}
