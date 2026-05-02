package org.atlas.flight.coredata.domain.phone.repository;

import org.atlas.flight.coredata.domain.phone.entity.Phone;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface PhoneRepository extends JpaRepository<Phone, Long> {

	List<Phone> findByCountryCdAndUseYnOrderBySortOrderAsc(String countryCd, String useYn);

	Optional<Phone> findByCountryCdAndPhoneCd(String countryCd, String phoneCd);

	boolean existsByCountryCdAndPhoneCd(String countryCd, String phoneCd);
}
