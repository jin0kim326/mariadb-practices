-- 집계쿼리 : SELECT 그릅함수가 적용된 경우 
SELECT avg(salary)
  FROM salaries;
  
-- emp_no는 의미가없음, oracle의경우 해당 쿼리는 오류인데 mysql은 오류가아님 
-- => SELECT 절에 그룹 함수가 있는 경우, 어떤 컬럼도 SELECT에 올 수 없다.
SELECT emp_no,avg(salary)
  FROM salaries;

-- query 실행 순서
-- (1) from: 접근 테이블 확인
-- (2) where: 조건에 맞는 row 선택 
-- (3) 집계
-- (4) projection
SELECT avg(salary)
  FROM salaries
 WHERE emp_no='10060';
 
-- group by 에 참여하고 있는 컬럼은 projection이 가능 (select절에 올 수 있다)
SELECT emp_no, avg(salary) AS avg_salary
  FROM salaries
GROUP BY emp_no
ORDER BY avg_salary
;

-- having 
-- 집계결과 ( 결과 임시 테이블) row를 선택해야 하는 경우
-- 이미 where절은 실행이 되었기 때문에, having절에서 조건을 주어야 함.
  SELECT emp_no, avg(salary) AS avg_salary
    FROM salaries
GROUP BY emp_no
  HAVING avg_salary > 60000
ORDER BY avg_salary
;

-- 예제 
-- salaries 테이블에서 사번이 10060인 직원의 급여 평균과 총합을 출력
-- 문법적으로 오류!!  (의미는 맞기는 함 where절 떄문에)
SELECT emp_no, avg(salary), sum(salary)
  FROM salaries
 WHERE emp_no='10060';