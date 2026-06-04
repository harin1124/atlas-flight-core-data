package org.atlas.flight.coredata.domain.airport.service;

import org.atlas.flight.coredata.domain.airport.dto.request.AirportCreateRequest;
import org.atlas.flight.coredata.domain.airport.entity.Airport;

import java.util.List;

public interface AirportService {

	List<Airport> listByCountryCd(String countryCd);

	Airport getByIataCd(String iataCd);

	void createAirport(AirportCreateRequest request);
}
