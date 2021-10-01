-- select 연습
SELECT *
  FROM departments;

SELECT dept_no, dept_name
  FROM departments;
  
  
-- alias(as 생략가능)
-- 예제 : employees 테이블에서 직원의 이름,성별,입사일을 출력
SELECT  first_name as '이름', 
		gender as '성별', 
        hire_date as '입사일'
  FROM employees
ORDER BY first_name;
  
-- 예제2 : 예제 1번 + concat함수
SELECT concat(first_name, ' ', last_name) as '이름',
;
-- distinct
-- 예제: title 테이블에서 모든 직급의 이름을 출력
SELECT distinct (title)
  FROM titles
  ;
  
-- where절 #1
-- 예제: 1991년 이전에 입사한 직원의 이름,성별,입사일을 출력
SELECT first_name, gender, hire_date
  FROM employees
 WHERE hire_date < '1991-00-00'	 -- 비교연산자
;
-- where절 #2
-- 예제 : 1989년 이전에 입사한 여직원
SELECT first_name, gender, hire_date
  FROM employees
 WHERE gender = 'F'
   AND hire_date < '1989-01-01'
 ;
 
-- where절 #3 : in 연산자
-- 예제 : dept_emp 테이블에서 부서 번호가 d005나 d009 속한 사원의 사번, 부서번호 번호
-- 1.1 OR 사용
SELECT emp_no, dept_no
  FROM dept_emp
 WHERE dept_no = 'd005'
    OR dept_no = 'd009'; 

-- 1.2 IN 사용
SELECT emp_no, dept_no
  FROM dept_emp
 WHERE dept_no IN ('d005', 'd009')       
   ; 

-- 1.3 서브쿼리 사용
SELECT emp_no, dept_no
  FROM dept_emp
 WHERE dept_no = (SELECT 'd005');
    
-- where절 #4 : LIKE 검색
-- 예제: 1989년에 입사한 직원의 이름,입사일을 출력
SELECT *
  FROM employees
 WHERE '1989-01-01' <= hire_date
   AND hire_date <= '1989-12-31' ;
   
SELECT *
  FROM employees
 WHERE hire_date between '1989-01-01' AND  '1989-12-31'
 ORDER BY hire_date;
   
SELECT *
  FROM employees
 WHERE hire_date like '1989%'
 ;
 
 -- order by 절 #1
 -- 예제: 남자 직원의 전체 이름, 성별, 입사일을 입사일 순 (선임순)
 SELECT concat(first_name, ' ' , last_name) as 'Name',
		gender,
        hire_date
   FROM employees
  WHERE gender = 'M'
 ORDER BY hire_date asc
 ;

-- 예제2 : 직원들의 사번, 월급 => 사번, 얼급순으로 출력
SELECT emp_no, salary, to_date
  FROM salaries
ORDER BY emp_no asc, salary desc ; 



  SELECT * FROM employees;