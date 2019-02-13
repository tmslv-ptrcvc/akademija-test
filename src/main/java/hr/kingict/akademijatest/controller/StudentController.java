package hr.kingict.akademijatest.controller;

import hr.kingict.akademijatest.entity.Student;
import hr.kingict.akademijatest.form.StudentForm;
import hr.kingict.akademijatest.service.StudentService;
import hr.kingict.akademijatest.validator.StudentValidatorImpl;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/student")
@CrossOrigin
public class StudentController {

    protected final Log logger = LogFactory.getLog(getClass());

    private final StudentService studentService;
    private final StudentValidatorImpl studentValidator;

    public StudentController(StudentService studentService, StudentValidatorImpl studentValidator) {
        this.studentService = studentService;
        this.studentValidator = studentValidator;
    }

    @PostMapping("/add")
    @Secured("ROLE_ADMIN")
    public ResponseEntity<?> addStudent(@Valid @RequestBody StudentForm form, BindingResult result){
        // validacija
        studentValidator.validate(form, result);

        // provjera grešaka
        if (result.hasErrors()){
            // TODO bolje napraviti svoj objekt za greške umjesto mape
            Map<String, String> errorMap = result.getAllErrors()
                    .stream()
                    .collect(Collectors.toMap(error -> error.getCode(), error -> error.getDefaultMessage()));

            return new ResponseEntity<>(errorMap, HttpStatus.BAD_REQUEST);
        }
        Student student = studentService.saveStudent(form.getStudent());

        return new ResponseEntity<>(student, HttpStatus.CREATED);
    }

    @GetMapping("/all")
    public Iterable<Student> getAllStudents(){
        return studentService.findAll();
    }

    @GetMapping("/all/pageable")
    public Iterable<Student> getAllStudentsPageable(@RequestParam int page, @RequestParam int size){
        return studentService.findAll(page, size);
    }

    @GetMapping("/{studentId}")
    public ResponseEntity<?> getStudentById(@PathVariable Long studentId){
        Optional<Student> student = studentService.findById(studentId);
        if (!student.isPresent()){
            return new ResponseEntity<>("Student sa zadanim ID-jem ne postoji", HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>(student.get(), HttpStatus.OK);
    }

    @DeleteMapping("/{studentId}")
    public ResponseEntity<?> deleteStudentById(@PathVariable Long studentId){
        studentService.deleteById(studentId);

        return new ResponseEntity<>("Student je uspješno obrisan", HttpStatus.OK);
    }
}
