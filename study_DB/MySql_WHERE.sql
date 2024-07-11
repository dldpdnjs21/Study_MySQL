-- 20번 부서에 근무하는 사원의 사원번호, 사원명, 직책, 급여를 출력하시오.
select empno, ename, job, sal
from emp
where deptno = 20;

-- 직책이 MANAGER인 사원의 사원번호, 사원명, 직책, 입사일을 출력하시오.
select empno, ename, job, hiredate
from emp
where job = ‘MANAGER’;

-- 급여가 2000 이상인 사원의 사원번호, 사원명, 급여를 출력하시오.
select empno, ename, sal
from emp
where sal >= 2000;

-- FORD사원의 사원번호, 사원명, 부서번호를 출력하시오.
select empno, ename, deptno
from emp
where ename = ‘FORD’;

-- 1981년 6월 1일 이후에 입사한 사원의 사원번호, 사원명, 부서번호, 입사일을 출력하시오.
select empno, ename, deptno, hiredate
from emp
where hiredate  >= ‘19810601’; #묵시적(암묵적, 자동)형변환

-- 10번 부서에 근무하는 사원의 사원번호, 사원명, 매니저의 사원번호를 출력하시오.
select empno, ename, mgr
from emp
where deptno = 10;

-- 20번과 30번 부서에 근무하는 사원의 사원번호, 사원명, 매니저의 사원번호를 출력하시오.
select empno, ename, mgr
from emp
where deptno = 20 OR deptno=30;

-- 10,20번 부서의 부서번호, 부서명, 부서위치를 조회하시오.
select deptno, dname, loc
from dept
where deptno IN (10,20);

-- 3등급 급여의 최소급여와 최대급여를 출력하시오.
select losal, hisal
from salgrade
where grade = 3;