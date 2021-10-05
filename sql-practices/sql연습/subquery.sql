#### subquery ####
-- 1) from 절의 서브 쿼리
SELECT now() as n,
       sysdate() as b,
	   3+1 as c
       ;

SELECT *
  FROM (SELECT now() as n,
			   sysdate() as b,
			   3+1 as c)		 s;
  

-- example1
# 현재 Fai Bale이 근무하는 부서에서 근무하는 직원의 사번, 전체 이름을 출력

# 1-1 : Fai Bale이 근무하는 부서번호 단 하나를 쿼리로 뽑아내기
SELECT de.dept_no
  FROM employees e,
       dept_emp de       
 WHERE e.emp_no = de.emp_no
   AND de.to_date = '9999-01-01'
   AND concat(e.first_name, ' ', e.last_name) = 'Fai Bale';
   
# 1-2 : 뽑아낸 부서번호를 서브쿼리로 써서 해당 부서번호의 근무원들을 뽑아내기
SELECT *
  FROM employees e,
	   dept_emp de
 WHERE e.emp_no = de.emp_no
   AND de.to_date = '9999-01-01'
   AND de.dept_no = (SELECT de.dept_no
					  FROM employees e,
						   dept_emp de       
					 WHERE e.emp_no = de.emp_no
					   AND de.to_date = '9999-01-01'
					   AND concat(e.first_name, ' ', e.last_name) = 'Fai Bale')
;
# = = = = = = = = = = = = = = = = = = = = = = #
# 2-1 ) 단일행 연산자 : =, >, <, >=, <=, <>, !=  #
# = = = = = = = = = = = = = = = = = = = = = = #
-- Question 1
# 현재 전체 사원의 평균 연봉보다 적은 급여를 받는 사원의 이름, 급여를 출력

SELECT avg(s.salary) AS 평균연봉
  FROM salaries s
 WHERE s.to_date = '9999-01-01'
;

SELECT e.last_name AS 네임,
	   s.salary AS 급여
  FROM employees e,
       salaries s
 WHERE e.emp_no = s.emp_no
   AND s.to_date = '9999-01-01'
   AND s.salary  < (SELECT avg(s.salary) AS 평균연봉
					  FROM salaries s
					 WHERE s.to_date = '9999-01-01')
ORDER BY 급여 desc
;

-- Question 2
# 현재 가장 적은 평균 급여의 직책과 평균급여를 출력

# 2-1) 직책별 평균급여
	SELECT t.title AS 직책,
		   avg(s.salary) AS 평균급여
	  FROM titles t,
		   salaries s
	 WHERE t.emp_no = s.emp_no
	   AND t.to_date = '9999-01-01'
	   AND s.to_date = '9999-01-01'
  GROUP BY t.title
;

# 2-2) 가장 적은 평균 급여
SELECT min(평균급여)
  FROM (SELECT t.title AS 직책,
			   avg(s.salary) AS 평균급여
		  FROM titles t,
			   salaries s
		 WHERE t.emp_no = s.emp_no
		   AND t.to_date = '9999-01-01'
		   AND s.to_date = '9999-01-01'
	  GROUP BY t.title) as a 
	;

# 2-3) 직책(title)을 평균급여와 함께 출력하기 위해 having절에 서브쿼리를 사용
	SELECT t.title AS 직책,
		   avg(s.salary) AS 평균급여
	  FROM titles t,
		   salaries s
	 WHERE t.emp_no = s.emp_no
	   AND t.to_date = '9999-01-01'
	   AND s.to_date = '9999-01-01'
  GROUP BY t.title
    HAVING 평균급여 = (SELECT min(평균급여)
					  FROM (SELECT t.title AS 직책,
								   avg(s.salary) AS 평균급여
							  FROM titles t,
								   salaries s
							 WHERE t.emp_no = s.emp_no
							   AND t.to_date = '9999-01-01'
							   AND s.to_date = '9999-01-01'
						  GROUP BY t.title) as a )
;

## 2-4 ) 쉽게 풀기
	SELECT t.title AS 직책,
		   avg(s.salary) AS 평균급여
	  FROM titles t,
		   salaries s
	 WHERE t.emp_no = s.emp_no
	   AND t.to_date = '9999-01-01'
	   AND s.to_date = '9999-01-01'
  GROUP BY t.title
  ORDER BY 평균급여 asc
     LIMIT 0,1
;


# = = = = = = = = = = = = = = = = = = = = = = #
# 2-1 ) 복수행 연산자 : in, not in, any, all     #
# = = = = = = = = = = = = = = = = = = = = = = #
-- any 사용법
# 1. =any : in 과 동일함
# 2. >any, >=any : 최소값 
# 3. <any, <=any : 최대값 
# 4. <>any : not in 과 동일함 

-- all 사용법
# 1. =all (x)
# 2. >all, >=all : 최대값
# 3. <all, <=all : 최소값 

-- Question3
# 현재 급여가 50000 이상인 직원의 이름을 출력
# 3 sol1 : join으로 풀기
SELECT e.first_name,
	   s.salary
  FROM employees e,
       salaries s
 WHERE e.emp_no = s.emp_no
   AND s.salary > 50000
ORDER BY s.salary asc
   ;
   
# 3 sol2 : subquery (in)
SELECT emp_no,
       salary
  FROM salaries
 WHERE to_date = '9999-01-01'
   AND salary > 50000
;

SELECT *
  FROM employees e,
	   salaries s
 WHERE e.emp_no = s.emp_no
   AND b.to_date = '9999-01-01'
   AND IN (e.emp_no, s.salary)  (	SELECT emp_no,
										   salary
									  FROM salaries
									 WHERE to_date = '9999-01-01'
									   AND salary > 50000)   
;
# 3. sol3 : subquery (=any)

-- Question4 
# 각 부서별로 최고 월급을 받는 직원의 이름과 부서, 월급 출력
	SELECT de.dept_no,
		   max(s.salary)
	  FROM dept_emp de,
		   salaries s
	 WHERE de.emp_no = s.emp_no
	   AND de.to_date = '9999-01-01'
	   AND s.to_date = '9999-01-01'
  GROUP BY de.dept_no
  ;
  
# Q4 sol-1 : where subquery =any(in)
SELECT e.first_name,
	   d.dept_name,
	   s.salary
  FROM dept_emp de,
       salaries s,
       employees e,
       departments d
 WHERE de.emp_no = s.emp_no
   AND s.emp_no = e.emp_no
   AND d.dept_no = de.dept_no
   AND de.to_date ='9999-01-01'
   AND s.to_date ='9999-01-01'
   AND (de.dept_no, s.salary) in (  SELECT de.dept_no,
										   max(s.salary)
									  FROM dept_emp de,
										   salaries s
									 WHERE de.emp_no = s.emp_no
									   AND de.to_date = '9999-01-01'
									   AND s.to_date = '9999-01-01'
								  GROUP BY de.dept_no) 
   ;
   
# Q4 sol-2 : from subquery
SELECT e.first_name,
	   d.dept_name,
	   s.salary
  FROM dept_emp de,
       salaries s,
       employees e,
       departments d,
       (SELECT de.dept_no,
			   max(s.salary) as max_salary
		  FROM dept_emp de,
			   salaries s
		 WHERE de.emp_no = s.emp_no
		   AND de.to_date = '9999-01-01'
		   AND s.to_date = '9999-01-01'
	  GROUP BY de.dept_no) sq
 WHERE de.emp_no = s.emp_no
   AND s.emp_no = e.emp_no
   AND d.dept_no = de.dept_no
   AND de.dept_no = sq.dept_no
   AND de.to_date ='9999-01-01'
   AND s.to_date ='9999-01-01'
   AND s.salary = sq.max_salary
   
   ;