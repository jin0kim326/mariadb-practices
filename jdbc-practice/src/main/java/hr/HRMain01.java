package hr;

import java.util.List;
import java.util.Scanner;

public class HRMain01 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("이름입력 > ");
		String name = scanner.next();
		EmployeeDao dao = new EmployeeDao();
		dao.findByName(name);
		
		List<EmployeeVo> result = dao.findByName(name);
		
		for (EmployeeVo vo : result) {
			System.out.println(
					vo.getNo() + ":" + vo.getFirstName() + ":" + vo.getLastName() + ":" + vo.getHireDate()
			);
		}
	}

}

