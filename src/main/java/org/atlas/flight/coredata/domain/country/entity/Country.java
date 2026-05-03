package org.atlas.flight.coredata.domain.country.entity;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.atlas.flight.coredata.domain.countrylanguage.entity.CountryLanguage;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Entity
@Table(name = "TBL_COUNTRY")
@EntityListeners(AuditingEntityListener.class)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Country {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

	@Column(name = "COUNTRY_CD", length = 2, nullable = false, unique = true)
	private String countryCd;

	@Column(name = "COUNTRY_CD3", length = 3, nullable = false, unique = true)
	private String countryCd3;

	@Column(name = "COUNTRY_KOR_NM", length = 100, nullable = false)
	private String countryKorNm;

	@Column(name = "COUNTRY_ENG_NM", length = 100, nullable = false)
	private String countryEngNm;

	@Column(name = "NATIONALITY_KOR_NM", length = 100)
	private String nationalityKorNm;

	@Column(name = "NATIONALITY_ENG_NM", length = 100)
	private String nationalityEngNm;

	@Column(name = "REGION_CD", length = 10)
	private String regionCd;

	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "COUNTRY_CD", referencedColumnName = "COUNTRY_CD", insertable = false, updatable = false)
	private List<CountryLanguage> countryLanguages = new ArrayList<>();

	@Column(name = "USE_YN", length = 1, nullable = false)
	private String useYn;

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

	public static Country createNew(
			String countryCd,
			String countryCd3,
			String countryKorNm,
			String countryEngNm,
			String nationalityKorNm,
			String nationalityEngNm,
			String regionCd,
			String useYn
	) {
		Country c = new Country();
		c.countryCd = countryCd;
		c.countryCd3 = countryCd3;
		c.countryKorNm = countryKorNm;
		c.countryEngNm = countryEngNm;
		c.nationalityKorNm = nationalityKorNm;
		c.nationalityEngNm = nationalityEngNm;
		c.regionCd = regionCd;
		c.useYn = useYn != null ? useYn : "Y";
		return c;
	}
}
