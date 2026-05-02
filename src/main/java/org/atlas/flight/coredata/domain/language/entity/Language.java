package org.atlas.flight.coredata.domain.language.entity;

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
@Table(name = "TBL_LANGUAGE")
@EntityListeners(AuditingEntityListener.class)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Language {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;

	@Column(name = "LANGUAGE_CD", length = 2, nullable = false, unique = true)
	private String languageCd;

	@Column(name = "LANGUAGE_CD3", length = 3, unique = true)
	private String languageCd3;

	@Column(name = "LANGUAGE_KOR_NAME", length = 100, nullable = false)
	private String languageKorNm;

	@Column(name = "LANGUAGE_ENG_NAME", length = 100, nullable = false)
	private String languageEngNm;

	@Column(name = "RTL_YN", length = 1, nullable = false)
	private String rtlYn;

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

	public static Language createNew(
			String languageCd,
			String languageCd3,
			String languageKorNm,
			String languageEngNm,
			String rtlYn,
			String useYn
	) {
		Language l = new Language();
		l.languageCd = languageCd;
		l.languageCd3 = languageCd3;
		l.languageKorNm = languageKorNm;
		l.languageEngNm = languageEngNm;
		l.rtlYn = rtlYn != null ? rtlYn : "N";
		l.useYn = useYn != null ? useYn : "Y";
		return l;
	}
}
