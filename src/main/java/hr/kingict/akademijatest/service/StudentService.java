package hr.kingict.akademijatest.service;

import hr.kingict.akademijatest.entity.Student;

import java.util.Optional;

public interface StudentService {

    Student saveStudent(Student student);

    Iterable<Student> findAll();

    Iterable<Student> findAll(int page, int size);

    Optional<Student> findById(Long studentId);

    void deleteById(Long studentId);
}
