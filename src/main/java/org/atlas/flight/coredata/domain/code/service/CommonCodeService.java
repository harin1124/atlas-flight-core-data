package org.atlas.flight.coredata.domain.code.service;

import org.atlas.flight.coredata.domain.code.dto.request.CommonCodeCreateRequest;
import org.atlas.flight.coredata.domain.code.entity.CommonCode;

import java.util.List;

public interface CommonCodeService {

	List<CommonCode> listByUpCd(String upCd);

	CommonCode getCommonCode(String upCd, String cd);

	void createCommonCode(CommonCodeCreateRequest request);
}
