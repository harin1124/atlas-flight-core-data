package org.atlas.flight.coredata.domain.code.service.impl;

import lombok.RequiredArgsConstructor;
import org.atlas.flight.core.exception.ApiException;
import org.atlas.flight.core.message.ResponseCodeGeneral;
import org.atlas.flight.coredata.domain.code.dto.request.CommonCodeCreateRequest;
import org.atlas.flight.coredata.domain.code.entity.CommonCode;
import org.atlas.flight.coredata.domain.code.entity.CommonCodeId;
import org.atlas.flight.coredata.domain.code.mapper.CommonCodeMapper;
import org.atlas.flight.coredata.domain.code.repository.CommonCodeRepository;
import org.atlas.flight.coredata.domain.code.service.CommonCodeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommonCodeImpl implements CommonCodeService {

	private final CommonCodeRepository commonCodeRepository;
	private final CommonCodeMapper commonCodeMapper;

	@Override
	public List<CommonCode> listByUpCd(String upCd) {
		return commonCodeRepository.findByIdUpCdAndUseYnAndDelYnOrderBySortOrderAsc(upCd, "Y", "N");
	}

	@Override
	public CommonCode getCommonCode(String upCd, String cd) {
		return commonCodeRepository
				.findById(new CommonCodeId(upCd, cd))
				.orElseThrow(() -> new ApiException(ResponseCodeGeneral.NOT_FOUND));
	}

	@Override
	@Transactional
	public void createCommonCode(CommonCodeCreateRequest request) {
		CommonCodeId id = new CommonCodeId(request.getUpCd(), request.getCd());
		if (commonCodeRepository.existsById(id)) {
			throw new ApiException(ResponseCodeGeneral.BAD_REQUEST);
		}
		commonCodeRepository.save(commonCodeMapper.toEntity(request));
	}
}
