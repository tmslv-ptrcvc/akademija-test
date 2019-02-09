package hr.kingict.akademijatest.repository;

import hr.kingict.akademijatest.entity.Student;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {

    Page<Student> findAll(Pageable pageable);
}
