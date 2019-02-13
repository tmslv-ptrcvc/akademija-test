package hr.kingict.akademijatest.validator;

import hr.kingict.akademijatest.form.StudentForm;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class StudentValidatorImpl implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return StudentForm.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object o, Errors errors) {
        StudentForm form = (StudentForm) o;

        // broj godina
        if (form.getAge() < 19){
            errors.reject("age", "Student ne može biti maloljetan!");
        }
    }
}
