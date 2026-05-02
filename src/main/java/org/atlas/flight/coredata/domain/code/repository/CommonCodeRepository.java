package org.atlas.flight.coredata.domain.code.repository;

import org.atlas.flight.coredata.domain.code.entity.CommonCode;
import org.atlas.flight.coredata.domain.code.entity.CommonCodeId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommonCodeRepository extends JpaRepository<CommonCode, CommonCodeId> {

	List<CommonCode> findByIdUpCdAndUseYnAndDelYnOrderBySortOrderAsc(String upCd, String useYn, String delYn);
}
