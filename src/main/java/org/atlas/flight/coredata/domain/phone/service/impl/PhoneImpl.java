package org.atlas.flight.coredata.domain.phone.service.impl;

import lombok.RequiredArgsConstructor;
import org.atlas.flight.core.exception.ApiException;
import org.atlas.flight.core.message.ResponseCodeGeneral;
import org.atlas.flight.coredata.domain.phone.dto.request.PhoneCreateRequest;
import org.atlas.flight.coredata.domain.phone.entity.Phone;
import org.atlas.flight.coredata.domain.phone.mapper.PhoneMapper;
import org.atlas.flight.coredata.domain.phone.repository.PhoneRepository;
import org.atlas.flight.coredata.domain.phone.service.PhoneService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PhoneImpl implements PhoneService {
	private final PhoneRepository phoneRepository;
	private final PhoneMapper phoneMapper;

	@Override
	public List<Phone> listByCountryCd(String countryCd) {
		return phoneRepository.findByCountryCdAndUseYnOrderBySortOrderAsc(countryCd, "Y");
	}

	@Override
	public Phone getPhone(String countryCd, String phoneCd) {
		return phoneRepository
				.findByCountryCdAndPhoneCd(countryCd, phoneCd)
				.orElseThrow(() -> new ApiException(ResponseCodeGeneral.NOT_FOUND));
	}

	@Override
	@Transactional
	public void createPhone(PhoneCreateRequest request) {
		if (phoneRepository.existsByCountryCdAndPhoneCd(request.getCountryCd(), request.getPhoneCd())) {
			throw new ApiException(ResponseCodeGeneral.BAD_REQUEST);
		}
		phoneRepository.save(phoneMapper.toEntity(request));
	}
}
