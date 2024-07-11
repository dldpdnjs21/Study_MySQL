-- 사원들의 직급종류는 몇 개(=몇 행)인지 출력하시오.
select count(distinct job)
from emp;

-- 전체 사원의 수(=전체 행의 개수)를 구하시오.
select count(ename)
from emp;

-- 가장 오래 근무한 사원의 입사일을 구하시오.
select min(hiredate)
from emp;

-- 부서별 평균 급여를 구하시오.(부서번호가 작은 부서부터 출력)
select deptno, avg(sal)
from emp
group by deptno;

-- 부서의 평균 급여가 2000 이상인 부서의 부서번호와 평균 급여를 출력하시오.
select deptno, avg(sal)
from emp
group by deptno
having  avg(sal) >= 2000;

--  평균급여(==> 2073.21429)보다 더 많은 급여를 받은 사원의 사원번호, 사원명, 급여를 출력하시오.
select empno, ename, sal
from emp
where  sal  > (select  avg(sal)
                  from emp);
                  
-- 급여가 1000 이상인 사원들에 대해서만 부서별로 평균을 구하고 이 중에 평균 급여가 2000 이상인 부서의 부서번호와 평균급여를 출력하시오.
select deptno, avg(sal)
from   emp              -- 14행
where  sal>=1000        -- 12행 (SMITH,JAMES사원 제외)
group by deptno;        -- 3행  (10번,20번,30번 부서) 

select deptno, avg(sal)
from   emp              -- 14행
where  sal>=1000        -- 14행(전체행)에 대한 조건 후 12행 (SMITH,JAMES사원 제외)
group by deptno         --  3행 (10번, 20번, 30번 부서그룹)
having avg(sal) >= 2000;  -- 3행(그룹행)에 대한 조건 후 2행