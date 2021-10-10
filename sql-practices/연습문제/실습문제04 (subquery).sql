# 문제1 : 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
-- 1-1 (평균연봉구하기)
SELECT avg(salary) AS avg_salary
  FROM salaries
 WHERE to_date = '9999-01-01'
 ;

-- 1-2 서브쿼리적용  
 SELECT count(*)
   FROM employees e,
		salaries s
  WHERE e.emp_no = s.emp_no
	AND s.to_date = '9999-01-01'
    AND salary > (SELECT avg(salary) AS avg_salary
					FROM salaries
				   WHERE to_date = '9999-01-01')
;
 
# 문제2 : 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
-- 2-1 각 부서별(group by) / 최고연봉 
SELECT d.dept_name,
	   sa.emp_no,
	   concat(sa.first_name, ' ', sa.last_name) as 이름,
       sa.salary
  FROM dept_emp de,
       departments d,
       (SELECT e.emp_no,s.salary, e.first_name, e.last_name
		  FROM employees e,
			   salaries s
		 WHERE e.emp_no = s.emp_no
		   AND s.to_date = '9999-01-01') sa 
 WHERE sa.emp_no = de.emp_no
   AND de.dept_no = d.dept_no   
   AND de.to_date = '9999-01-01'
GROUP BY d.dept_no
HAVING max(sa.salary)
ORDER BY max(sa.salary) desc
  ;

# 문제3 : 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
-- 3-1  급여
SELECT *
  FROM employees e,
	   salaries s
 WHERE e.emp_no = s.emp_no
   AND s.to_date = '9999-01-01'
;

SELECT  sa.emp_no, sa.name, sa.salary, d.dept_name
  FROM departments d,
	   dept_emp de,
       (SELECT e.emp_no, s.salary, concat(e.first_name, ' ', e.last_name) AS name
		  FROM employees e,
			   salaries s
		 WHERE e.emp_no = s.emp_no
		   AND s.to_date = '9999-01-01') sa
 WHERE d.dept_no = de.dept_no
   AND de.emp_no = sa.emp_no
   AND de.to_date = '9999-01-01'
GROUP BY d.dept_no
  HAVING sa.salary > avg(sa.salary)
 ;
 
# 문제4 : 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.

SELECT concat(emp.first_name, ' ', emp.last_name) AS name,
	   emp.emp_no,
       concat(ma.first_name, ' ', ma.last_name) as manager_name,
       ma.dept_name
  FROM employees emp,
       (SELECT e.first_name, e.last_name, d.dept_name
		  FROM employees e,
			   dept_manager dm,
               departments d
		 WHERE e.emp_no = dm.emp_no
           AND dm.dept_no = d.dept_no
           AND dm.to_date='9999-01-01') ma

   ;
       
# 문제5 : 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.

# 문제6 : 평균 연봉이 가장 높은 부서는? 

# 문제7 : 평균 연봉이 가장 높은 직책?

# 문제8. : 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.



