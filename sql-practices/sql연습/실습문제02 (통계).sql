-- 문제 1. 최고임금(salary)과  최저임금을 “최고임금, “최저임금”프로젝션 타이틀로 함께 출력해 보세요. 두 임금의 차이는 얼마인가요? 함께 “최고임금 – 최저임금”이란 타이틀로 출력해 보세요.
SELECT max(salary) AS '최고임금',
	   min(salary) AS '최저임금',
       max(salary)-min(salary) AS '최고임금 - 최저임금'
  FROM salaries
;


-- 문제2. 마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
-- 예) 2014년 07월 10일
SELECT date_format(max(hire_date), '%Y년 %m월 %d일') AS '신입사원 마지막 입사일' 
  FROM employees
 ;

-- 문제3. 가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
-- 예) 2014년 07월 10일
SELECT date_format(min(hire_date), '%Y년 %m월 %d일') AS '최고참의 입사일' 
  FROM employees
  ;
##############################################################
# => 퇴사한 직원의 정보는 원래 없나?
##############################################################


-- 문제4. 현재 이 회사의 평균 연봉은 얼마입니까?
SELECT avg(salary)
  FROM salaries
 WHERE to_date = '9999-01-01'
 ;

-- 문제5. 현재 이 회사의 최고/최저 연봉은 얼마입니까?
SELECT max(salary) AS '최고연봉',
	   min(salary) AS '최저연봉'
  FROM salaries
 WHERE to_date = '9999-01-01'
 ;
###########################################################
# 문제 1번과 뭐가 다른가?
###########################################################

-- 문제6. 최고 어린 사원의 나이와 최 연장자의 나이는?
SELECT period_diff(date_format(now(),'%Y%m'), date_format(hire_date,'%Y%m')) as 'hire';

SELECT period_diff( date_format(max(birth_date), '%Y'), date_format(now(), '%Y')) AS '최연장자 사원',
	   period_diff( date_format(min(birth_date), '%Y'), date_format(now(), '%Y')) AS '어린사원'       
  FROM employees
 ;
