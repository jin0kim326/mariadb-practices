-- 함수 : 문자열 함수

-- upper
SELECT upper('buSaN'), upper('busan'), upper('DouZOne');
select upper(first_name) from employees;

-- lower
select lower('buSaN'), lower('busan'), lower('DouZOne');
select lower(first_name) from employees;

-- substring(문자열, index, length)
select substring('Hello World', 3, 2);

###########################################################
-- 예제:1989년에 입사한 사원들의 이름,입사일 출력
SELECT first_name, hire_date
  FROM employees
 WHERE 1989 = substring(hire_date, 1,4);
###########################################################

-- lpad(오른쪽정렬), rpad (왼쪽정렬)
SELECT lpad('1234', 10, '-' );
SELECT rpad('1234', 10, '-' );

-- 예제) 직원들의 월급을 오른쪽 정렬(빈공간은*)
SELECT lpad(salary,10, '*') 
  FROM salaries;
  
-- trim, ltrim, rtrim
SELECT concat('-----', ltrim('    hello    '), '----');
SELECT concat('-----', rtrim('    hello    '), '----');
SELECT concat('-----', trim(both 'x' from 'xx  xxx  hello  xx  xxx'), '----');