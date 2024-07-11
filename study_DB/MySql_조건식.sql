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

-- dept테이블에서 10번 부서의 위치를 'NEW YORK'에서 '서울'로 변경하시오.
update dept set loc='서울'
where deptno=10;

-- 사원테이블(emp)에서 30번 부서에 근무하는 사원들의 급여를 10%인상하시오.
update emp set sal= sal + sal*0.1
where deptno=30;

select * from emp;
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

-- 사원들의 사원번호, 사원명, 커미션을 출력하되 커미션을 받지않는(커미션의 값이 null) 사원들은 0으로 출력하시오.
select empno, ename, ifnull(comm,0)
from emp;
-- 사원들의 사원번호, 사원명, 커미션을 출력하되 커미션을 받지않는(커미션의 값이 null) 사원들은 '없음'으로 출력하시오.
select empno, ename, ifnull(comm,'없음')
from emp;

-- 10번 부서에 근무하는 사원들의 사원번호, 사원명, 직책, 매니저(상사)를 출력하시오. (단, 매니저가 없는 경우 'CEO'를 출력하시오.)
select empno, ename, job , ifnull(mgr,'CEO') mgr
from emp
where deptno=10;
