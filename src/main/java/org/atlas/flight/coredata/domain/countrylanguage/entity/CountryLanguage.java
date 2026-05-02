package org.atlas.flight.coredata.domain.countrylanguage.entity;

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
@Table(name = "TBL_COUNTRY_LANGUAGE")
@EntityListeners(AuditingEntityListener.class)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class CountryLanguage {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

	@Column(name = "COUNTRY_CD", length = 2, nullable = false)
	private String countryCd;

	@Column(name = "LANGUAGE_CD", length = 2, nullable = false)
	private String languageCd;

	@Column(name = "OFFICIAL_YN", length = 1, nullable = false)
	private String officialYn;

	@Column(name = "PRIMARY_YN", length = 1, nullable = false)
	private String primaryYn;

	@Column(name = "SORT_ORDER", nullable = false)
	private int sortOrder;

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

	public static CountryLanguage createNew(
			String countryCd,
			String languageCd,
			String officialYn,
			String primaryYn,
			int sortOrder,
			String delYn
	) {
		CountryLanguage c = new CountryLanguage();
		c.countryCd = countryCd;
		c.languageCd = languageCd;
		c.officialYn = officialYn != null ? officialYn : "N";
		c.primaryYn = primaryYn != null ? primaryYn : "N";
		c.sortOrder = sortOrder;
		c.delYn = delYn != null ? delYn : "N";
		return c;
	}
}
