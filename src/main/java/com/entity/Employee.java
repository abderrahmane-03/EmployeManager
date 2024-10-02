package com.entity;

import javax.persistence.*;

@Entity
@Table(name = "employees")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String email;
    private String phone;
    private String department;
    private String position;


    protected Employee(int id,String name,String email,String phone,String department,String position){
        this.id=id;
        this.name=name;
        this.email=email;
        this.department=phone;
        this.phone=department;
        this.position=position;
    };

    public Employee() {

    }

    public void getId(int id){
        this.id = id;
    };
    public void getName(String name){
      this.name = name;
    };
    public void setName(){
        this.name = name;
    };
    public void getemail(String email){
        this.email = email;
    };
    public void setemail(){
        this.email = email;
    };
    public void getPhone(String phone){
        this.phone = phone;
    };
    public void setPhone(){
        this.phone = phone;
    };
    public void getDepartment(String department){
        this.department = department;
    };
    public void setDepartment(){
        this.department = department;
    };
    public void getPosition(String position){
        this.position = position;
    };
    public void setPosition(){
        this.position = position;
    };


}
