package hr;

public class EmployeeVo {
	private Long no;
	private String brithDate;
	private String firstName;
	private String lastName;
	private String gender;
	@Override
	public String toString() {
		return "EmployeeVo [no=" + no + ", brithDate=" + brithDate + ", firstName=" + firstName + ", lastName="
				+ lastName + ", gender=" + gender + ", hireDate=" + hireDate + ", salary=" + salary + "]";
	}
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getBrithDate() {
		return brithDate;
	}
	public void setBrithDate(String brithDate) {
		this.brithDate = brithDate;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHireDate() {
		return hireDate;
	}
	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	private String hireDate;
	private int salary;
}
