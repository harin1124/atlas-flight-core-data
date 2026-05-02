package org.atlas.flight.coredata.domain.code.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@Getter
@Entity
@Table(name = "TBL_COMMON_CODE")
@EntityListeners(AuditingEntityListener.class)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class CommonCode {
	@EmbeddedId
	private CommonCodeId id;

	@Column(name = "CD_KOR_NM", length = 50, nullable = false)
	private String cdKorNm;

	@Column(name = "CD_ENG_NM", length = 100)
	private String cdEngNm;

	@Column(name = "DESCRIPTION", length = 300)
	private String description;

	@Column(name = "SORT_ORDER", nullable = false)
	private int sortOrder;

	@Column(name = "USE_YN", length = 1, nullable = false)
	private String useYn;

	@Column(name = "DEL_YN", length = 1, nullable = false)
	private String delYn;
	
	@CreatedDate
	@Column(name = "REG_DT", nullable = false, updatable = false)
	private LocalDateTime regDt;
	
	@CreatedBy
	@Column(name = "RGTR_ID", length = 30, nullable = false)
	private String rgtrId;
	
	@LastModifiedDate
	@Column(name = "MDFCN_DT", nullable = false)
	private LocalDateTime mdfcnDt;
	
	@LastModifiedBy
	@Column(name = "MDFR_ID", length = 30, nullable = false)
	private String mdfrId;

	public static CommonCode createNew(
			String upCd,
			String cd,
			String cdKorNm,
			String cdEngNm,
			String description,
			int sortOrder,
			String useYn
	) {
		CommonCode c = new CommonCode();
		c.id = new CommonCodeId(upCd, cd);
		c.cdKorNm = cdKorNm;
		c.cdEngNm = cdEngNm;
		c.description = description;
		c.sortOrder = sortOrder;
		c.useYn = useYn != null ? useYn : "Y";
		c.delYn = "N";
		return c;
	}
}
