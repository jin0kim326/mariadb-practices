-- 함수 : 수학 

-- abs (절대값)
SELECT abs(-1), abs(1);

-- mod
SELECT mod(10,3);

-- floor (바닥)
SELECT floor(3.14);

-- ceil (천장)
SELECT ceil(3.14);

-- round(i) : i에 가장 근접한 정수
-- round(i, d) : i값 중에 소수점 d자리에 가장 근접한 실수
SELECT round(5.6314122), round(1.4987,3);

-- pow(x, y), power(x,y) x의 y승
Select pow(2,10), power(2,10);

-- sign(x)
select sign(20), sign(-100), sign(0);

-- greatest(x,y, ...), least(x,y,...)
SELECT greatest(10,40,20,30), least(10,40,20,30);
SELECT greatest('b', 'A', 'C'), greatest('hello', 'hellp', 'hellq');