package org.atlas.flight.coredata.domain.airport.service.impl;

import lombok.RequiredArgsConstructor;
import org.atlas.flight.core.exception.ApiException;
import org.atlas.flight.core.message.ResponseCodeGeneral;
import org.atlas.flight.coredata.domain.airport.dto.request.AirportCreateRequest;
import org.atlas.flight.coredata.domain.airport.entity.Airport;
import org.atlas.flight.coredata.domain.airport.mapper.AirportMapper;
import org.atlas.flight.coredata.domain.airport.repository.AirportRepository;
import org.atlas.flight.coredata.domain.airport.service.AirportService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AirportImpl implements AirportService {

	private final AirportRepository airportRepository;
	private final AirportMapper airportMapper;

	@Override
	public List<Airport> listByCountryCd(String countryCd) {
		return airportRepository.findByCountry_CountryCdAndUseYnOrderByIataCdAsc(countryCd, "Y");
	}

	@Override
	public Airport getByIataCd(String iataCd) {
		return airportRepository
				.findByIataCd(iataCd)
				.orElseThrow(() -> new ApiException(ResponseCodeGeneral.NOT_FOUND));
	}

	@Override
	@Transactional
	public void createAirport(AirportCreateRequest request) {
		if (airportRepository.existsByIataCd(request.getIataCd())) {
			throw new ApiException(ResponseCodeGeneral.BAD_REQUEST);
		}
		if (StringUtils.hasText(request.getIcaoCd()) && airportRepository.existsByIcaoCd(request.getIcaoCd())) {
			throw new ApiException(ResponseCodeGeneral.BAD_REQUEST);
		}
		airportRepository.save(airportMapper.toEntity(request));
	}
}
