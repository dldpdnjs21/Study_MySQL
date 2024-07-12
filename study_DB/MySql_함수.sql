# -------------------  숫자 함수  -------------------
-- 5, 0, 5
select abs(-5), abs(0), abs(+5)
from dual;

-- 13, 13, -12, -12
select ceil(12.2), ceiling(12.2), ceil(-12.2), ceiling(-12.2)
from dual;

-- 12, -13
select floor(12.6), floor(-12.2)
from dual;

-- 1526, 1526, 1526.2, 1526.16, 1530, 2000
select round(1526.159), round(1526.159, 0), round(1526.159, 1),
       round(1526.159, 2), round(1526.159, -1), round(1526.159, -3)
from dual;

-- 1526  1526.1  1526.15  1520  1000
select truncate(1526.159, 0), truncate(1526.159, 1), 
       truncate(1526.159, 2), truncate(1526.159, -1), truncate(1526.159, -3)
from dual;

-- 8  8
select pow(2, 3), power(2, 3)
from dual;

-- 2  2
select mod(8, 3), 8 % 3
from dual;

-- 9  3
select greatest(4, 3, 7, 5, 9), least(4, 3, 7, 5, 9)
from dual;

# ------------------- 문자 관련 함수 ----------------------
-- 48   65  97
select ASCII('0'), ASCII('A'), ASCII('a')
from dual;

-- 7788번 사원의 이름 SCOTT
select concat(empno, '번 사원의 이름 ', ename)
from emp
where empno = 7788;

-- hello ureca !!!
select insert('helloabc!!!', 6, 3, ' ureca ')
from dual;

-- hello ureca !!!
select replace('helloabc!!!', 'abc', ' ureca ')
from dual;

-- 7
select instr('hello ureca !!!', 'ureca')
from dual;

-- ureca, ureca
select mid('hello ureca !!!', 7, 5), substring('hello ureca !!!', 7, 5)
from dual;

-- hello ureca !!!
select reverse('!!! aceru olleh')
from dual;

-- hello ureca !!!, hello ureca !!!
select lower('hELlo UreCa !!!'), lcase('hELlo UreCa !!!')
from dual;

-- HELLO URECA !!!, HELLO URECA !!!
select upper('hELlo UreCa !!!'), ucase('hELlo UreCa !!!')
from dual;

-- hello, ca !!!
select left('hello ureca !!!', 5), right('hello ureca !!!', 6)
from dual;

# ------------------- 날짜 관련 함수 ----------------------
-- 2024-07-12 06:57:27, 2024-07-12 06:57:27, 2024-07-12 06:57:27
select now(), sysdate(), current_timestamp()
from dual;

-- 2024-07-12, 2024-07-12, 06:57:47, 06:57:47
select curdate(), current_date(), curtime(), current_time()
from dual;

-- 2024-07-12 06:58:04, 2024-07-12 06:58:09, 2024-07-12 11:58:04, 2024-07-17 06:58:04
select now() 현재시간, date_add(now(), interval 5 second) 5초후,
       date_add(now(), interval 5 hour) 5시간후, date_add(now(), interval 5 day) 5일후
from dual;

-- 2024, 7, July, Friday, 12, 6, 4, 194, 27
select year(now()), month(now()), monthname(now()), 
       dayname(now()), dayofmonth(now()), dayofweek(now()), 
       weekday(now()), dayofyear(now()), week(now())
from dual;

-- 2024-07-12 06:59:05  2024 July 12 AM 6 59 05 24-07-12 06:59:05   24.07.12 Friday 06시59분05초
select now(), date_format(now(), '%Y %M %e %p %l %i %S'), date_format(now(), '%y-%m-%d %H:%i:%s'),
       date_format(now(), '%y.%m.%d %W'), date_format(now(), '%H시%i분%s초')
from dual;

# ------------------- 논리 관련 함수 ----------------------
-- 크다  작다  3  b  a
select if(3 > 2, '크다', '작다'), if(3 > 5, '크다', '작다'), 
       nullif(3, 3), nullif(3, 5), 
       ifnull(null, 'b'), ifnull('a', 'b')
from dual;

# ------------------- 집계 함수 ----------------------
-- 14, 29025, 2073.214285714286, 5000, 800
-- 사원의 총수, 급여의 합, 급여의 평균, 최고급여, 최저급여
select count(empno), sum(sal), avg(sal), max(sal), min(sal)
from emp;
