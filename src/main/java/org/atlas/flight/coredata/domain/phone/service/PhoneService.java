package org.atlas.flight.coredata.domain.phone.service;

import org.atlas.flight.coredata.domain.phone.dto.request.PhoneCreateRequest;
import org.atlas.flight.coredata.domain.phone.entity.Phone;

import java.util.List;

public interface PhoneService {

	List<Phone> listByCountryCd(String countryCd);

	Phone getPhone(String countryCd, String phoneCd);

	void createPhone(PhoneCreateRequest request);
}
