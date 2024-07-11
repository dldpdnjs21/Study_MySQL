-- 30번 부서에 근무하는 사원의 사원번호, 사원명, 급여를 출력하되 사원번호에 대해 내림차순으로 정렬하시오.
select empno, ename, sal
from emp
where deptno = 30
order by empno desc;

-- 30번 부서에 근무하는 사원의 사원번호, 사원명, 급여를 출력하되 사원명에 대해 오름차순으로 정렬하시오.
select empno, ename, sal
from emp
where deptno = 30
order by ename;

-- 30번 부서에 근무하는 사원의 사원번호, 사원명, 급여를 출력하되 급여를 많이 받는 순으로 출력하시오.
select empno, ename, sal
from emp
where deptno = 30
order by sal desc;

-- 가장 최근에 입사한 사원부터 사원번호, 사원명, 급여, 입사일을 출력하시오.
select empno, ename, sal, hiredate
from emp
order by hiredate desc;

-- 급여가 많은 순으로 사원번호, 사원명, 급여를 출력하시오. (단, 급여가 같을 경우 사원명을 기준으로 오름차순 출력하시오.)
select empno, ename, sal
from emp
order by sal desc, ename asc; #asc(오름차순) 생략가능