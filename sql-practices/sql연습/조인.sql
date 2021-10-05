-- inner join
-- 예제 : employees 테이블과 title 테이블을 join하여 직원의 이름과 직책을 모두 출력
SELECT a.first_name, b.title
  FROM employees a, titles b
 WHERE a.emp_no = b.emp_no			-- join condition (두 테이블을 합치는 조건)  조인조건은 (테이블-1)개가 있어야한다.
   AND b.to_date = '9999-01-01'		-- row 선택 조건
   ;
-- 예제2 : employees 테이블과 titles 테이블을 join하여 직원의 이름과 직책을 출력하되, 여성 엔지니어만 출력
SELECT a.first_name, b.title, a.gender
  FROM employees a, titles b
 WHERE a.emp_no = b.emp_no			-- join condition (두 테이블을 합치는 조건)  조인조건은 (테이블-1)개가 있어야한다.
   AND b.to_date = '9999-01-01'		-- row 선택 조건
   AND a.gender = 'f'
   AND b.title = 'engineer'
   ;
   
--
-- ANSI/ISO SQL1999 JOIN 표준 문법
--

-- 1) natural join
-- 두 테이블에 공통 컬럼이 있으면 별다른 조인 조건 없이 암묵적 조인

-- emp_no이 공통컬럼
	  SELECT count(*) -- a.first_name, b.title
		FROM employees a
NATURAL JOIN titles b
	   WHERE b.to_date = '9999-01-01' -- row 선택조건
       ;
       
       select * FROM employees;
       select * FROM titles;
-- 2) join ~ using
	  SELECT a.first_name, b.title
		FROM employees a join titles b using (emp_no)
	   WHERE b.to_date = '9999-01-01' -- row 선택조건
       ;
       
-- 3) join ~ on (추천!!)
	  SELECT a.first_name, b.title
		FROM employees a JOIN titles b on a.temp_no = b.emp_no
	   WHERE b.to_date = '9999-01-01' -- row 선택조건
       ;
       
-- outer join
-- INSERT INTO dept values(null, '총무'); 
-- INSERT INTO dept values(null, '영업');
-- INSERT INTO dept values(null, '개발');
-- INSERT INTO dept values(null, '기획');

-- INSERT INTO emp values(null,'둘리',1);
-- INSERT INTO emp values(null,'마이콜',2);
-- INSERT INTO emp values(null,'또치',3);
-- INSERT INTO emp values(null,'길동',null);
;

SELECT * FROM dept;
SELECT * FROM emp;

SELECT *
  FROM emp a
  JOIN dept b ON a.dept_no = b.no;

SELECT *
  FROM emp a
  LEFT JOIN dept b ON a.dept_no = b.no;
  
SELECT *
  FROM emp a
RIGHT JOIN dept b ON a.dept_no = b.no;
  
-- Question1
# 현재 회사 상황을 반영한 직원별 근무부서를 사번,이름,근무 부서로 출력
SELECT e.emp_no,
	   e.first_name,
       d.dept_name
  FROM employees e,
	   dept_emp de,
       departments d
 WHERE e.emp_no = de.emp_no
   AND de.dept_no = d.dept_no
   AND de.to_date = '9999-01-01'
  ;
  
-- Question2
# 현재 회사에서 지급되고 있는 급여체계를 반영한 결과 출력
# 사번, 이름, 연봉 
SELECT e.emp_no,
	   e.first_name,
       s.salary
  FROM employees e,
	   salaries s
 WHERE e.emp_no = s.emp_no
   AND s.to_date = '9999-01-01'
ORDER BY s.salary desc
   ;
   
-- Question3
# 현재 직책별로 평균 연봉과 인원수를 구하되 직책별로 인원이 100명 이상인 직책
	SELECT t.title AS 직책,
		   avg(s.salary) AS 평균연봉, 
		   count(*) AS 인원수
	  FROM titles t,
		   salaries s
	 WHERE t.emp_no = s.emp_no
	   AND t.to_date = '9999-01-01'
	   AND s.to_date = '9999-01-01'
  GROUP BY t.title
	HAVING 인원수 >= 100
  ORDER BY 평균연봉 desc
	;
    
-- Question4
# 현재 부서별로 현재 직책이 Engineer인 직원들에 대해서만 평균급여를 구하세요.
SELECT 
  FROM 
 ; 
-- Question5
# 현재 직책별로 급여의 총합을 구하되 Engineer 직책은 제외
# 단 총합이 2,000,000,000 이상인 직책만 / 내림차순 정렬
	SELECT t.title AS 직책,
		   sum(s.salary) AS 연봉총합
	  FROM salaries s,
		   titles t
	 WHERE s.emp_no = t.emp_no
	   AND t.title <> 'Engineer'
       AND t.to_date = '9999-01-01'
       AND s.to_date = '9999-01-01'
  GROUP BY t.title
    HAVING 연봉총합 > 2000000000
  ORDER BY 연봉총합 desc
;


