package org.atlas.flight.coredata.domain.code.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Getter
@Embeddable
@EqualsAndHashCode
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class CommonCodeId implements Serializable {
	@Column(name = "UP_CD", length = 10, nullable = false)
	private String upCd;

	@Column(name = "CD", length = 10, nullable = false)
	private String cd;
}
