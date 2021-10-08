package com.mind.project.repository;





import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mind.project.model.NoName;

public interface NoNameRepository extends JpaRepository<NoName, Integer> {

	@Query(value="select * from noname order by no_name_count desc ",nativeQuery=true)
	List<Object[]> findnoNameCount();

}
