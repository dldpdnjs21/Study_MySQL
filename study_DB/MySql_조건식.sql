-- 사원명이 'A'로 시작되는 사원의 정보(사원번호,사원명,급여)를 출력하시오.
select empno, ename, sal
from emp
where ename like 'A%';

-- 사원명이 'S'로 끝나는 사원의 정보(사원번호,사원명,급여)를 출력하시오.
select empno, ename, sal
from emp
where ename like '%S';

-- 사원명에 'A'문자가 포함된 사원의 정보(사원번호,사원명,급여)를 출력하시오.
select empno, ename, sal
from emp
where ename like '%A%';

-- 사원명의 세번째 문자에 'A'문자가 포함된 사원의 정보(사원번호,사원명,급여)를 출력하시오.
select empno, ename, sal
from emp
where ename like '__A%';

-- 사원명에 '%'문자가 포함된 사원의 정보(사원번호,사원명,급여)를 출력하시오.
insert into emp (empno, ename, sal)
			values (8000, '홍%길동', 2500);
select empno, ename, sal
from emp
where ename like '%\%%';

-- 커미션을 300, 500, 1400 받는 사원의 정보(사원번호, 사원명, 부서번호, 커미션)를 출력하시오.
select empno, ename, deptno, comm
from emp
where comm=300 or comm=500 or comm=1400;

select empno, ename, deptno, comm
from emp
where comm IN (300,500,1400);

-- 급여가 1600 이상이고 3000 이하인 사원의 정보(사원번호, 사원명, 급여)를 출력하시오.
select empno, ename, sal
from emp
where sal between 1600 and 3000;

select *from dept;

-- 커미션을 받는 사원의 사원번호, 사원명, 부서번호, 커미션을 출력하시오.
select empno, ename, deptno, comm
from emp
where comm > 0;

-- 커미션을 받을 조건이 되는 사원의 사원번호, 사원명, 부서번호, 커미션을 출력하시오.
select empno, ename, deptno, comm
from emp
where comm is null; #반대는 is not null

-- 커미션을 받지 않는 사원의 사원번호, 사원명, 부서번호, 커미션을 출력하시오.
select empno, ename, deptno, comm
from emp
where comm = 0;

-- 커미션을 받지 않는(커미션이 null인, 커미션을 받지않은 조건) 사원의 사원번호, 사원명, 부서번호, 커미션을 출력하시오.

-- 커미션을 받을 조건이 되는 사원의 사원번호, 사원명, 부서번호, 커미션을 출력하시오.
select empno, ename, deptno, comm
from emp
where comm is not null;

-- 전체사원의 사원번호, 사원명, 급여, 연봉(comm포함)을 출력하시오.
select empno, ename, sal, sal+comm "연봉"
from emp;
select empno, ename, sal, sal+ifnull(comm, 0) "연봉"
from emp;
#컬럼의 값이 null이였을때  적당한 값으로 대체!!  :  ifnull( null예상컬럼, 대체 데이터)
