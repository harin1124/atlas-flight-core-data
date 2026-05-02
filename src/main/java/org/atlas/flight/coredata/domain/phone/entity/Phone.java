package org.atlas.flight.coredata.domain.phone.entity;

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
@Table(name = "TBL_PHONE")
@EntityListeners(AuditingEntityListener.class)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Phone {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

	@Column(name = "COUNTRY_CD", length = 2, nullable = false)
	private String countryCd;

	@Column(name = "PHONE_CD", length = 10, nullable = false)
	private String phoneCd;

	@Column(name = "USE_YN", length = 1, nullable = false)
	private String useYn;

	@Column(name = "SORT_ORDER", nullable = false)
	private int sortOrder;

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

	public static Phone createNew(String countryCd, String phoneCd, String useYn, int sortOrder) {
		Phone p = new Phone();
		p.countryCd = countryCd;
		p.phoneCd = phoneCd;
		p.useYn = useYn != null ? useYn : "Y";
		p.sortOrder = sortOrder;
		return p;
	}
}
