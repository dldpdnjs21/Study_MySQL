-- 급여등급, 최소급여, 최대급여를 검색(조회)하시오.
select grade, losal, hisal from salgrade;

-- 부서명과 부서위치를 출력하시오.
select dname, loc from dept;

-- 사원번호, 사원명, 입사일, 급여를 조회(출력)하시오.
select empno, ename, hiredate from emp;

-- "안녕, SQL~!!"을 화면에 출력하시오.
select '안녕, SQL~!!' from dual;
#dual : 가상테이블, 한행이 입력되어 있고 특정한 테이블의 참조가 필요 없을 때 사용

-- 화면에 사원번호와 사원명을 출력하시오.
select empno 사원번호, ename as “사원명”
from emp;

-- 각 사원들의 사원번호, 사원명, 급여, 연봉을 출력하시오. (연봉 계산은 *12)
select empno, ename, sal, sal*12 “연봉”
from emp;

-- 사원들의 이름과 직책을 출력하시오.
select concat(ename, '사원의 직책은 ', job, '입니다.') from emp;

-- 10과 3의 사칙연산의 결과를 출력하는 SQL문을 작성하시오.
select 10+3 '더하기', 10-3 '빼기', 10*3 '곱하기', 10/3 '나누기'
					, 10%3 '나누기(나머지)', mod(10,3) '나누기(나머지2)'
					, floor(10/3) '나누기(몫)'
from dual; 
