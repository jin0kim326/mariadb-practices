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
  
  
SELECT * FROM dept;