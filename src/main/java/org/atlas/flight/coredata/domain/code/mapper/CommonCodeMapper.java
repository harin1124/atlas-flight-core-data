package org.atlas.flight.coredata.domain.code.mapper;

import org.atlas.flight.coredata.domain.code.dto.request.CommonCodeCreateRequest;
import org.atlas.flight.coredata.domain.code.entity.CommonCode;
import org.springframework.stereotype.Component;

@Component
public class CommonCodeMapper {
	public CommonCode toEntity(CommonCodeCreateRequest request) {
		return CommonCode.createNew(
				request.getUpCd(),
				request.getCd(),
				request.getCdKorNm(),
				request.getCdEngNm(),
				request.getDescription(),
				request.getSortOrder(),
				request.getUseYn()
		);
	}
}
