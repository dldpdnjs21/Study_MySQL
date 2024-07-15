use ureca;
create table emp_copy
select * from emp_copy;

# 1.테이블 구조와 전체 데이터 복사
create table emp_copy
select * from emp;

# 2.테이블 구조와 원하는 데이터 복사
create table emp_copy
select empno, ename, sal, depto
from emp
where deptno = 30;

# 3.테이블 구조만 복사
create table emp_copy
select *
from emp
where 1 = 0;

# 테이블 구조 확인
desc emp_copy;

# 테이블 내용(데이터) 확인
select * from emp_copy;

# 테이블 삭제
drop table emp_copy;

# 테이블 행의 개수 확인
select count(*) from emp_copy;

# 데이터 추가
insert into emp_copy (empno, ename, sal, deptno)
			values (8000, '나길동', 3100, 10);
            
insert into emp_copy (empno, ename, sal, deptno)
			values (8002, '우리길동', 3200, 20),
					(8004, '한길동', 3400, 40);
                    
insert into emp_copy
select * from emp
where deptno = 10;
 
create table dept_copy
select * from dept;

select * from dept_copy;

delete from dept
where deptno=10;
#Error Code: 1451. Cannot delete or update a parent row:
# a foreign key constraint fails (`ureca`.`emp`, CONSTRAINT `PK_EMP`
# FOREIGN KEY (`DEPTNO`) REFERENCES `dept` (`DEPTNO`))

# 10번부서 사원들을 20번부서로 이동시키시오!!
update emp set  deptno=20
where deptno=10;
select * from emp;
delete from dept
where deptno=10;
select * from dept;

create table test(
	col1 int
);
desc test; 

select * from test;

create table emp(
   deptno  int  REFERENCES dept (deptno)
);
create table emp(
   deptno  int,
   constraint emp_deptno_fk FOREIGN KEY (deptno) REFERENCES dept (deptno)
);

-- 미션1) emp테이블과 같은 구조, 같은 데이터를 갖는 emp_copy테이블을 생성하시오.
create table emp_copy(
	empno 		int				primary key,
    ename 		varchar(10)		not null,
    job 		varchar(9)		not null,
    mgr 		int,
    hiredate 	datetime		default now(),	
    sal 		double,
    comm 		double,
    deptno 		int				references dept(deptno)
);
create table emp_copy(
   empno      int           primary key,
   ename      varchar(10)   not null   default '무명',
   job        varchar(9)    not null,
   mgr        int,
   hiredate   datetime      default now( ),
   sal        double,
   comm       double,
   deptno     int   ,
   foreign key (deptno) references dept (deptno)
);

insert into emp_copy (empno,ename,sal,deptno)
             values (8000,'홍길동',3000, 50);
#Error Code: 1364. Field 'job' doesn't have a default value
insert into emp_copy (empno,ename,sal,deptno,job)
             values (8000,'홍길동',3000, 50, '대리');
#Error Code: 1452. Cannot add or update a child row:
#a foreign key constraint fails (`ureca`.`emp_copy`, CONSTRAINT `emp_copy_ibfk_1` FOREIGN KEY (`deptno`) REFERENCES `dept` (`DEPTNO`))

desc emp_copy;
drop table emp_copy;

-- 미션2) emp_copy테이블에서 30번 부서 사원들의 정보(사원번호, 사원명, 급여, 부서번호)를 참조하게 emp_view 뷰를 생성하고 조회하시오.
create or replace view emp_view30
as
select empno, ename, sal, grade, e.deptno, dname
from emp_copy e join salgrade s
on e.sal between  s.losal  and s.hisal
join dept  d
on e.deptno = d.deptno
where e.deptno=30;
#view사용
select * from emp_view30;
