use ureca;
SELECT * FROM ureca.dept;
insert into dept (deptno) values (50);
insert into dept (deptno, loc) values (60, '서울');
insert into dept values (70, '대전'); #에러
# values 앞에 컬럼명을 생략한다면 전체 컬럼을 의미
# 순서는 desc테이블(테이블 생성시 컬럼의 순서)했을 때의 순서임
insert into dept (deptno,dname,loc) values ( 70,'대전'); #에러
insert into dept values ( 70,'자재부','대전'); #입력실행성공

insert into dept   values  (80,'기획부','대구'),(90,'개발부','광주') ;
#한개의 insert명령문을 통해 여러행 입력이 가능

select * from dept;

desc dept;

delete from dept WHERE deptno = 50;

INSERT INTO `DEPT` (`DEPTNO`, `DNAME`, `LOC`) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');
commit;

delete from dept;

rollback;

select @@autocommit;
