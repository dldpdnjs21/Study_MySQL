--  사원들의 전체 급여 총합을 구하시오.
select sum(sal)
from emp;

-- 사원들의 평균 급여를 구하시오.
select avg(sal)
from emp;


-- 급여를 제일 많이 받는 topN 3명의 정보(사원번호, 사원명, 급여)를 출력
select empno, ename, sal
from emp
order by sal desc limit 3;