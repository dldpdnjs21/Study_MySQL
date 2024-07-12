-- 서브쿼리)  SCOTT사원과 같은 부서에 근무하는 사원의 사번과 이름, 부서번호를 출력하시오. (nested subquery)
select empno, ename, deptno
from emp
where deptno = 20;
select empno, ename, deptno
from emp
where deptno = (select deptno
                      from emp
                      where ename='SCOTT');
                      
select empno, ename, deptno
from emp
where not ename='SCOTT' and
		deptno = (select deptno
                      from emp
                      where ename='SCOTT');
  

-- 새로운 사원 'SCOTT' 입사했습니다.
insert into emp (empno, ename, sal, hiredate, deptno) values
                      (8000, 'SCOTT', 3100, now( ), 30);
                      
select empno, ename, deptno
from emp
where not ename='SCOTT' and
		deptno = (select deptno
                      from emp
                      where ename='SCOTT');
#Error Code: 1242. Subquery returns more than 1 row

select  empno, ename, deptno
from   emp
where  not ename='SCOTT' and
		deptno IN (select deptno
                      from emp
                      where ename='SCOTT');
			   -- IN (20,30) 의 의미를 갖음
               
-- 서브쿼리)30번 부서에서 근무하는 사원들 중 최소한 단 한명 보다 급여를 더 많이 받는 사원의 사번과 이름, 급여와 부서번호를 출력하시오.(nested subquery)
-- 30번 부서 사원들의 급여 => 1600   1250  1250  2850  1500  950
select empno, ename, sal, deptno
from emp
where sal > (1600, 1250, 1250, 2850, 1500, 950);
select empno, ename, sal, deptno
from emp
where sal > (select sal
                 from emp
                 where deptno=30);
# Error Code: 1242. Subquery returns more than 1 row
# ==> 솔루션) 다중행 연산자[IN/ANY/ALL]를 사용하시오!!

select empno, ename, sal, deptno
from emp
where sal  > ALL (select sal
                       from emp
                       where deptno=30);

select empno, ename, sal, deptno
from emp
where sal > any (select sal
					from emp
					where deptno=30);
                    
select empno, ename, sal, deptno
from emp
where sal > (select min(sal)
					from emp
					where deptno=30);
                    
select empno, ename, sal, deptno
from emp
where sal > max(sal);
# Error Code: 1111. Invalid use of group function
# ==> where절에서 그룹함수를 사용하는 것은 불가능. ==> 서브쿼리를 통해 해결
# ==> having절에서는 그룹함수 사용이 가능

select empno, ename, sal, deptno
from emp
where sal > (select max(sal)
				from emp
                where deptno=30);

-- 서브쿼리) 모든 사원의 평균 급여보다 적게 받는 사원들과 같은 부서에 근무하는 사원들의 정보(사원번호, 사원명, 급여, 부서번호)를 조회하시오.(inline subquery, inline view)
# ==> 스칼라 서브쿼리
select avg(sal) from emp where deptno=30;
# ==> 1566.66

# <느낌>
select empno, ename, sal ,deptno, 1566.66
from emp
where deptno=30;

#<스칼라 서브쿼리>
select empno, ename, sal ,deptno, (select avg(sal) from emp where deptno=30) as avg30
from emp
where deptno=30;

-------------------- 서브쿼리 미션 --------------------
-- 문제1) SCOTT와 급여가 동일하거나 더 많이 받는 사원의 이름과 급여출력.
select ename, sal
from emp
where sal >= any(select sal 
				from emp 
                where ename = 'SCOTT');

select ename, sal
from emp
where sal >= all(select sal 
				from emp 
                where ename = 'SCOTT');
    
-- 문제2) 직급(job)이  사원(CLERK)인 사람이 속한 부서의 부서번호와 부서명, 부서위치를 출력.
select deptno, dname, loc
from dept
where deptno in (select deptno
					from emp
					where job = 'CLERK');


-- 문제3) 사원명에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고 있는 사원의 사원번호와 이름을 출력.
select empno, ename
from emp 
where deptno in (select deptno
					from emp
                    where ename like '%T%');

-- 문제4) 부서위치가 NEW YORK인 모든 사원의 이름, 부서번호를 출력
select ename, deptno
from emp
where deptno in (select deptno
				from dept
                where loc ='NEW YORK');

-- 문제5) SALES부서의 모든 사원의 이름과 급여출력
select ename, sal
from emp
where deptno in (select deptno
					from dept
                    where dname='SALES');

-- 문제6) KING에게 보고하는 모든 사원의 이름과 급여를 출력
select ename, sal
from emp
where mgr in (select empno
				from emp
                where ename='KING');

-- 문제7) 자신의 급여가 평균 급여보다 많고  이름에 'S'가 들어가는 사원과
--       ------------------------ ----------
--               (1번째 조건)       (2번째 조건)
--                ---> 1,2번을 동시에 만족하는 사원의 부서
--       	동일한 부서에서 근무하는 모든 사원의 사원번호, 사원명, 급여 출력.

# 서브쿼리 첫번째 조건)
select deptno,ename,sal from emp 
where sal > (select avg(sal) from emp ); 
# 서브쿼리 두번째 조건)  
select deptno,ename,sal from emp 
where ename  like '%S%';

select empno, ename, sal
from emp
where deptno in (select deptno 
					from emp
                    where ename like '%S%'
                    and
                    sal>(select avg(sal) from emp));