package org.atlas.flight.coredata.domain.language.repository;

import org.atlas.flight.coredata.domain.language.entity.Language;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface LanguageRepository extends JpaRepository<Language, Long> {
	List<Language> findByUseYnOrderByLanguageCdAsc(String useYn);
	Optional<Language> findByLanguageCd(String languageCd);
	boolean existsByLanguageCd(String languageCd);
	boolean existsByLanguageCd3(String languageCd3);
}
