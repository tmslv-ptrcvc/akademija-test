package hr.kingict.akademijatest.service.impl;

import hr.kingict.akademijatest.entity.Student;
import hr.kingict.akademijatest.repository.StudentRepository;
import hr.kingict.akademijatest.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentRepository studentRepository;

    @Override
    public Student saveStudent(final Student student) {
        return studentRepository.save(student);
    }

    @Override
    public Iterable<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public Iterable<Student> findAll(int page, int size) {
        return studentRepository.findAll(PageRequest.of(page, size, Sort.by("surename").descending()));
    }

    @Override
    public Optional<Student> findById(final Long studentId) {
        return studentRepository.findById(studentId);
    }

    @Override
    public void deleteById(final Long studentId) {
        studentRepository.deleteById(studentId);
    }
}
