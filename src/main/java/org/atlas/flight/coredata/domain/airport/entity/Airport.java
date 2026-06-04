package org.atlas.flight.coredata.domain.airport.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.atlas.flight.coredata.domain.code.entity.CommonCode;
import org.atlas.flight.coredata.domain.country.entity.Country;
import org.hibernate.annotations.JoinColumnOrFormula;
import org.hibernate.annotations.JoinColumnsOrFormulas;
import org.hibernate.annotations.JoinFormula;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Entity
@Table(name = "TBL_AIRPORT")
@EntityListeners(AuditingEntityListener.class)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@JsonIgnoreProperties({ "airportType", "airportStat" })
public class Airport {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

	@Column(name = "IATA_CD", length = 3, nullable = false, unique = true)
	private String iataCd;

	@Column(name = "ICAO_CD", length = 4, unique = true)
	private String icaoCd;

	@Column(name = "AIRPORT_KOR_NM", length = 100, nullable = false)
	private String airportKorNm;

	@Column(name = "AIRPORT_ENG_NM", length = 100, nullable = false)
	private String airportEngNm;

	@Column(name = "AIRPORT_NAT_NM", length = 100)
	private String airportNatNm;

	/**
	 * FK: {@code TBL_AIRPORT.COUNTRY_CD} → {@code TBL_COUNTRY.COUNTRY_CD} (명세:
	 * {@code FK_AIRPORT_COUNTRY})
	 */
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "COUNTRY_CD", referencedColumnName = "COUNTRY_CD", nullable = false, foreignKey = @ForeignKey(name = "FK_AIRPORT_COUNTRY"))
	@JsonIgnoreProperties({ "countryLanguages", "hibernateLazyInitializer", "handler" })
	private Country country;

	@Column(name = "CITY_CD", length = 10)
	private String cityCd;

	@Column(name = "LATITUDE", precision = 9, scale = 6)
	private BigDecimal latitude;

	@Column(name = "LONGITUDE", precision = 9, scale = 6)
	private BigDecimal longitude;

	@Column(name = "TIMEZONE", length = 50)
	private String timezone;

	/**
	 * 논리 FK: {@code AIRPORT_TYPE_CD} → {@code TBL_COMMON_CODE} ({@code UP_CD='AIRPORT_TYPE'},
	 * {@code CD=AIRPORT_TYPE_CD})
	 */
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumnsOrFormulas({
			@JoinColumnOrFormula(formula = @JoinFormula(value = "'AIRPORT_TYPE'", referencedColumnName = "UP_CD")),
			@JoinColumnOrFormula(
					column = @JoinColumn(name = "AIRPORT_TYPE_CD", referencedColumnName = "CD", nullable = false)
			)
	})
	private CommonCode airportType;

	/**
	 * 논리 FK: {@code AIRPORT_STAT_CD} → {@code TBL_COMMON_CODE} ({@code UP_CD='AIRPORT_STAT'},
	 * {@code CD=AIRPORT_STAT_CD})
	 */
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumnsOrFormulas({
			@JoinColumnOrFormula(formula = @JoinFormula(value = "'AIRPORT_STAT'", referencedColumnName = "UP_CD")),
			@JoinColumnOrFormula(
					column = @JoinColumn(name = "AIRPORT_STAT_CD", referencedColumnName = "CD", nullable = false)
			)
	})
	private CommonCode airportStat;

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

	/** 편의용: 국가 코드만 필요할 때 (응답에 {@code country} 객체와 함께 노출 가능) */
	public String getCountryCd() {
		return country != null ? country.getCountryCd() : null;
	}

	public String getAirportTypeCd() {
		return airportType != null && airportType.getId() != null ? airportType.getId().getCd() : null;
	}

	public String getAirportStatCd() {
		return airportStat != null && airportStat.getId() != null ? airportStat.getId().getCd() : null;
	}

	public static Airport createNew(
			String iataCd,
			String icaoCd,
			String airportKorNm,
			String airportEngNm,
			String airportNatNm,
			Country country,
			String cityCd,
			BigDecimal latitude,
			BigDecimal longitude,
			String timezone,
			CommonCode airportType,
			CommonCode airportStat,
			String useYn) {
		Airport a = new Airport();
		a.iataCd = iataCd;
		a.icaoCd = icaoCd;
		a.airportKorNm = airportKorNm;
		a.airportEngNm = airportEngNm;
		a.airportNatNm = airportNatNm;
		a.country = country;
		a.cityCd = cityCd;
		a.latitude = latitude;
		a.longitude = longitude;
		a.timezone = timezone;
		a.airportType = airportType;
		a.airportStat = airportStat;
		a.useYn = useYn != null ? useYn : "Y";
		return a;
	}
}
