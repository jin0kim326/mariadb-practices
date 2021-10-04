-- 문제 1. 현재 급여가 많은 직원부터 직원의 사번, 이름, 그리고 연봉을 출력 하시오.
SELECT a.emp_no AS 사번,
	   concat(a.first_name,' ',a.last_name) AS 이름,
       b.salary AS 연봉
  FROM employees a, salaries b
 WHERE a.emp_no = b.emp_no
 ORDER BY b.salary
;

-- 문제2. 전체 사원의 사번, 이름, 현재 직책을 이름 순서로 출력하세요.
SELECT a.emp_no AS 사번, 
	   concat(a.first_name,' ',a.last_name) AS 이름,
       b.title AS 직책
  FROM employees a, titles b
 WHERE a.emp_no = b.emp_no
 ORDER BY a.last_name
 ;
 
-- 문제3. 전체 사원의 사번, 이름, 현재 부서를 이름 순서로 출력하세요..
SELECT concat(a.first_name,' ',a.last_name) AS 이름,
	   a.emp_no AS 사번,
       c.dept_name AS 부서명
  FROM employees a,
       dept_emp b,
       departments c
 WHERE a.emp_no = b.emp_no
   AND b.dept_no = c.dept_no
ORDER BY 이름
;
-- 문제4. 전체 사원의 사번, 이름, 연봉, 직책, 부서를 모두 이름 순서로 출력합니다.
SELECT a.emp_no AS 사번,
	   concat(a.first_name,' ',a.last_name) AS 이름,
       d.salary AS 연봉,
       e.title AS 직책,
       c.dept_name AS 부서명
  FROM employees a,
       dept_emp b,
       departments c,
       salaries d,
       titles e
 WHERE a.emp_no = b.emp_no
   AND b.dept_no = c.dept_no
   AND a.emp_no = d.emp_no
   AND a.emp_no = e.emp_no
ORDER BY 이름
;
-- 문제5. ‘Technique Leader’의 직책으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요. (현재 ‘Technique Leader’의 직책(으로 근무하는 사원은 고려하지 않습니다.) 이름은 first_name과 last_name을 합쳐 출력 합니다.
SELECT concat(a.first_name,' ',a.last_name) AS 이름,
	   a.emp_no AS 사번,
       to_date AS 근무일
  FROM employees a,
       titles t
 WHERE a.emp_no = t.emp_no
   AND t.title = 'Technique Leader'
   AND t.to_date <> '9999-01-01'
ORDER BY 이름
;

-- 문제6. 직원 이름(last_name) 중에서 S(대문자)로 시작하는 직원들의 이름, 부서명, 직책을 조회하세요.
SELECT a.emp_no AS 사번,
	   concat(a.first_name,' ',a.last_name) AS 이름,
       d.dept_name AS 부서명,
       t.title AS 직책
  FROM employees a,
	   titles t,
       dept_emp de,
       departments d
 WHERE a.emp_no = t.emp_no
   AND a.emp_no = de.emp_no
   AND de.dept_no = d.dept_no
   AND a.last_name like 's%'
 ORDER BY 이름
;
###########################################
# 's%' 안에 함수 쓸수있나?
###########################################

-- 문제7. 현재, 직책이 Engineer인 사원 중에서 현재 급여가 40000 이상인 사원을 급여가 큰 순서대로 출력하세요.
SELECT a.emp_no AS 사번, 
	   concat(a.first_name,' ',a.last_name) AS 이름,
       s.salary AS 급여
  FROM employees a, 
	   salaries s,
       titles t
 WHERE a.emp_no = s.emp_no
   AND a.emp_no = t.emp_no
   AND s.salary >= 40000
   AND t.to_date = '9999-01-01'
 ORDER BY 급여 desc
 ;
 
-- 문제8. 현재 급여가 50000이 넘는 직책을 직책, 급여로 급여가 큰 순서대로 출력하시오
SELECT s.salary AS 급여,
       t.title AS 직책
  FROM employees a, 
	   salaries s,
       titles t
 WHERE a.emp_no = s.emp_no
   AND a.emp_no = t.emp_no
   AND s.salary >= 50000
   AND s.to_date = '9999-01-01'
 ORDER BY 급여 desc
 ;

-- 문제9. 현재, 부서별 평균 연봉을 연봉이 큰 부서 순서대로 출력하세요.
SELECT  d.dept_name AS 부서명,
		avg(s.salary) AS 평균연봉
  FROM employees a, 
	   salaries s,
       dept_emp de,
       departments d
 WHERE a.emp_no = s.emp_no
   AND a.emp_no = de.emp_no
   AND de.dept_no = d.dept_no
   AND s.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY 평균연봉 
;

-- 문제10. 현재, 직책별 평균 연봉을 연봉이 큰 직책 순서대로 출력하세요.
SELECT  t.title AS 직책명,
		avg(s.salary) AS 평균연봉
  FROM employees a, 
	   salaries s,
	   titles t
 WHERE a.emp_no = s.emp_no
   AND a.emp_no = t.emp_no
   AND s.to_date = '9999-01-01'
GROUP BY t.title
ORDER BY 평균연봉 
;