package com.zhan.crud.entity;

public class Employee {
    private Integer empId;

    private String empName;

    private String sex;

    private String email;

    private Integer dId;
    private Department department;
    //empName=test&email=test%40zhan.com&sex=M&dId=1

    public Employee() {
		super();
	}

	public Employee(Integer empId, String empName, String sex, String email, Integer dId) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.sex = sex;
		this.email = email;
		this.dId = dId;
	}

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", sex='" + sex + '\'' +
                ", email='" + email + '\'' +
                ", dId=" + dId +
                ", department=" + department +
                '}';
    }
}