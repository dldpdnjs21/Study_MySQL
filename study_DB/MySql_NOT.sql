-- 30번 부서에 근무하는 사원의 정보(사원번호,사원명,부서번호,직책)를 출력하시오.
select empno, ename, deptno, job
from   emp
where  deptno=30;

-- 30번 부서에 근무하지 않는 사원의 정보(사원번호,사원명,부서번호,직책)를 출력하시오.
select empno, ename, deptno, job
from   emp
where  deptno!=30;

select empno, ename, deptno, job
from   emp
where  not deptno=30;

-- 이름에 'A'를 포함하지 않는 사원의 사원번호, 사원명, 부서번호를 출력하시오.
select empno, ename, deptno
from   emp
where  ename like '%A%';   

select empno, ename, deptno
from   emp
where  ename not like '%A%';   

select empno, ename, deptno
from   emp
where  not ename like '%A%'; 

-- 급여가 1600 이상이고 3000 이하인 사원의 사원번호, 사원명, 급여를 출력하시오.
select empno, ename, sal
from emp
where sal>=1600 and sal<=3000;
   
select empno, ename, sal
from emp
where sal  between 1600 and 3000;

-- 급여가 1600 미만 또는 3000 초과인 사원의 사원번호, 사원명, 급여를 출력하시오.
select empno, ename, sal
from emp
where sal<1600 or sal>3000;
    
select empno, ename, sal
from emp
where not (sal>=1600 and sal<=3000);
    
select empno, ename, sal
from emp
where sal  not between 1600 and 3000;