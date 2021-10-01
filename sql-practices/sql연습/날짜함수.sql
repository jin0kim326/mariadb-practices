-- 함수 : 날짜 함수

-- CURDATE(), CURRENT_DATE => 날짜만
SELECT CURDATE(), CURRENT_DATE;

-- CURTIME(), CURRENT_TIME => 시간만 
SELECT CURTIME(), CURRENT_TIME;

-- now() vs sysdate() => 날짜 + 시간
SELECT now(), sysdate();
SELECT now(), sleep(2), now();  -- 쿼리가 시작된 순간
SELECT sysdate(), sleep(2), sysdate(); -- 함수가 호출된 순간

-- date_format(date, format)
SELECT (date_format (now(), '%Y-%m-%d / %h:%i:%s')) as 'Time';
SELECT (date_format (now(), '%Y-%c-%d / %h:%i:%s')) as 'Time';

-- period_diff
-- YYMM, YYYYMM
-- ex) 근무 개월 수를 출력
SELECT period_diff( date_format(now(),'%Y%m'), date_format(hire_date,'%Y%m')) as 'hire'
  FROM employees
ORDER BY hire desc
  ;
  
-- date_add (=adddate), date_sub(=subdate)
-- 날짜를 date에 type(day, month, year) 형식의 표현식(expr) 더하거나 뺌
-- ex) 각 사원들의 근무 년수가 5년이 되는 날을 출력
SELECT first_name,
		hire_date,
        date_add(hire_date, interval 5 year)
  FROM employees;
  
-- cast
SELECT '12345'+10 , cast('12345' as int) + 10;
SELECT date_format(cast('2021-10-01' as date),'%Y년-%m월-%d일'); -- date형으로 cast해주어야만 date_format을 활용할 수 있음
select cast(1-2 as unsigned);
select cast(cast(1-2 as unsigned)as signed);

-- mysql type
-- varchar(최대값2000), char(값지정), CLOB(Character Large Object)
-- signed(unsigned), int(integer), medium int, big int, int(default 11자리)
-- float, double
-- time, date, datetime


  
  select * FROM employees;