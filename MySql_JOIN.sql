select empno, ename, sal, emp.deptno, dname
from emp, dept;
-- 56개의 행
select empno, ename, sal, emp.deptno, dname
from emp join dept;
-- 56개의 행
select empno, ename, sal, emp.deptno, dname
from emp cross join dept;
-- 56개의 행
select empno, ename, sal, emp.deptno, dname
from emp inner join dept
on emp.deptno = dept.deptno;
-- 14개의 행

-- 문제) 사번이 7788인 사원의 사번, 이름, 급여, 부서번호, 부서이름을 출력하시오.
select empno, ename, sal, emp.deptno, dname
from emp join dept
on emp.deptno = dept.deptno
where empno = 7788;

select empno, ename, sal, emp.deptno, dname
from emp join dept
using (deptno)
where empno = 7788;
# using(공통컬럼) 사용 시 테이블명은 명시하면 안된다

select empno, ename, sal, emp.deptno, dname
from emp natural join dept
where empno = 7788;
# natural join은 두 테이블의 이름이 동일한 컬럼을 기준으로 매핑한다(오류 가능성이 있음, 권장x)

select empno, ename, sal, grade "급여등급"
from emp join salgrade
on emp.sal >= losal
and emp.sal <= hisal;

select empno, ename, sal, grade "급여등급"
from emp join salgrade
on emp.sal between losal and hisal;

-- 문제) 회사에 근무하는 모든 사원의 사번, 이름, 부서번호, 부서명을 출력하시오.(단, 사원이 속하지 않은 부서에 대한 정보도 함께 출력)
select empno, enmae, emp, emp.deptno, dname
from emp as e join dept d;
# Error Code: 1054. Unknown column 'ename' in 'field list'

select empno, ename, d.deptno, dname
from   emp as e  right join dept d
on e.deptno=d.deptno;
# 14명 사원의 정보와 함께 사원이 속하지 않은 부서의 정보까지 출력

-- 문제) 모든 사원의 사번, 이름, 매니저 사번, 매니저 이름을 출력하시오.
select me.empno "사원번호", me.ename "사원명",
      manager.empno "매니저사번", manager.ename "매니저명"
from emp me  join  emp manager
on me.mgr  =  manager.empno
where me.ename='SMITH';

--------------- JOIN 미션 ---------------
# 아래의 문제들을 ANSI JOIN으로 해결하시오.
# 문제1) 사원들의 이름, 부서번호, 부서이름을 출력
select ename, emp.deptno, dname
from emp inner join dept;

select ename, emp.deptno, dname
from emp inner join dept
on emp.deptno = dept.deptno;
  
# 문제2) 부서번호가 30번인 사원들의 이름, 직급, 부서번호, 부서위치를 출력
select ename, job, e.deptno, loc
from emp e join dept d
on e.deptno = d.deptno
where e.deptno = 30;

# 문제3) 커미션을 받는 사원의 이름, 커미션, 부서이름, 부서위치 출력(커미션 0은 제외)
select ename, comm, dname, loc
from emp join dept
where comm != 0 and comm is not null;

# 문제4) DALLAS에서 근무하는 사원들의 이름, 직급, 부서번호, 부서이름을 출력
select ename, job, emp.deptno, dname
from emp join dept
on emp.deptno = dept.deptno
where loc = "DALLAS";

# 문제5) 사원이름에 'A'가 들어가는(포함하는) 사원들의 이름과 부서이름을 출력
select ename, dname
from emp join dept
on emp.deptno = dept.DEPTNO
where ename like '%A%';

# 문제6) 사원이름과 직급, 급여, 급여등급을 출력
select ename, job, sal, grade
from emp join salgrade
on emp.sal between  losal  and  hisal;
select ename, job, sal, dname, grade
from emp join dept join salgrade
on emp.sal between losal and hisal
and emp.deptno = dept.deptno;

# 문제7) 사원들의 이름과 그 사원과 같은 부서에 근무하는 사원의 사원명, 부서번호를 출력
#       ===> 자기 이름을 제외한 동료(56행) 정보 출력!!
select me.ename,     companion.ename,  companion.deptno
from emp me join emp companion -- 196행?  14 *  14
on me.deptno = companion.deptno -- 70행
where  me.empno  <>  companion.empno;   -- 56행

# 추가문제) 모든 사원(14명)들의 사원번호와 사원명 그리고 매니저명을 출력하시오.
select me.empno "사원번호", me.ename "사원명", ifnull(manager.ename,"없음") "매니저명"
from emp me left join emp manager
on me.mgr = manager.empno;

