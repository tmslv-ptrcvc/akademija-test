package hr.kingict.akademijatest.form;

import hr.kingict.akademijatest.entity.Student;

import javax.validation.constraints.NotBlank;

public class StudentForm {

    @NotBlank(message = "Ime ne smije biti prazno")
    private String name;
    private String surename;
    private Integer age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurename() {
        return surename;
    }

    public void setSurename(String surename) {
        this.surename = surename;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Student getStudent(){
        return new Student(this.name, this.surename, this.age);
    }
}
