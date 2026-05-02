package org.atlas.flight.coredata.domain.phone.mapper;

import org.atlas.flight.coredata.domain.phone.dto.request.PhoneCreateRequest;
import org.atlas.flight.coredata.domain.phone.entity.Phone;
import org.springframework.stereotype.Component;

@Component
public class PhoneMapper {
	public Phone toEntity(PhoneCreateRequest request) {
		return Phone.createNew(
				request.getCountryCd(),
				request.getPhoneCd(),
				request.getUseYn(),
				request.getSortOrder()
		);
	}
}
