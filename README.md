SQL
- Structured Query Language (구조적인 질의어)

---

| 데이터 정의어(DDL): Data Definition Language | - 데이터베이스 관리자나 응용 프로그래머가 데이터베이스의 논리적인 구조를 정의하기 위한 언어.
- 객체(예:table,view, trigger)에 대한 정의
- 명령어: CREATE, DROP, ALTER, RENAME, TRUNCATE  |
| --- | --- |
| 데이터 조작어(DML): Data Manipulation Language  ★ | - 데이터베이스에 저장된 데이터를 조작(추가,삭제,수정)하기 위해 사용하는 언어
- 명령어: INSERT, DELETE, UPDATE, SELECT |
| 데이터 제어어(DCL): Data Control Language | - 데이터베이스에 대한 접근 권한 부여 등의 데이터베이스 시스템의 관리를 위한 목적으로 사용되는 언어
- 명령어: GRANT(권한 부여), REVOKE(권한 회수) |
| 데이터 질의어(DQL): Data Query Language  ★ | - 검색,조회 명령어
- 명령어: SELECT |
| 트랜잭션 제어어(TCL): Transaction Control Language | - 논리적인 (DML)작업 단위의 묶음
- 명령어: COMMIT, ROLLBACK, SAVEPOINT |

```
※INSERT
==> insert into 테이블명 [(컬럼명1, 컬럼명2)] values (데이터1, 데이터2) ;
==> insert into 테이블명 [(컬럼명1, 컬럼명2)] values (데이터1, 데이터2),(데이터1, 데이터2) ;
         
※DELETE
==> delete from 테이블명
         [ where  조건식  ];

※UPDATE
==> update 테이블명 set 컬럼명1=변경데이터1, 컬럼명2=변경데이터2
         [ where  조건식  ]; 
```

### <테이블에 저장된 데이터에 대한 검색(조회)>

===> select명령문 사용

형식)
SELECT (조회하고 싶은)컬럼명
FROM   (컬럼이 속한)테이블명;

### <테이블 내의 데이터를 검색>

형식)
SELECT 컬럼명1, 컬럼명2
FROM  (검색하고자 하는 컬럼명이 속한)테이블명;

select empno,ename, dname
from       emp       ,   dept;  ----> 두개이상의 테이블 조회: JOIN


### <WHERE절> - 조건절, 출력행을 제어하는 역할

형식)
SELECT 컬럼명  ---------> 전체 열중 원하는 열만 선택   : 열을 제어
FROM   테이블명
WHERE  조건식(conditions);  ---------> 전체 행중 원하는 행만 선택   : 행을 제어
---------> 전체 행중 '조건식'에 일치하는 행만 선택


### ※ 조건식 구성

====>   기준컬럼명         연산자        비교데이터

                                     --------
                                 (비교연산자)
                                > , < , >= , <=
                            = (같다, 등가연산자)           ename = 'ADAMS'
                                  !=(다르다),  <>


### <조건식의 구성>

컬럼명         연산자       비교데이터

### <LIKE연산자>

형식)     컬럼명   LIKE  'pattern'
----> 패턴과 닮은 컬럼이 속한 행을 조회
----> 패턴내의 예약문자(횟수를 표현하는 문자)
%   : 0~n개의 문자를 대체
_   : 단 1개의 문자를 대체

DB에 저장된 문자데이터 예) 'a',  'ab', 'ad', 'abc',  'abbbbb',  'bababa'

like 'a'   ----->   'a'         : % 또는 _ 문자를 사용하지 않는다면 등호와 같은 결과!!
=  'a'

like 'a%'  ----->  a문자로 시작하는 데이터!!        ==> startsWith
----->  'a',  'ab', 'ad', 'abc',  'abbbbb'

like 'a__' -----> 'abc'

like '%a'  ----->  a문자로 끝나는 데이터!!            ==> endsWith
----->  'a', 'bababa'

like '__c' -----> 'abc'

like '%a%' -----> a문자를 포함하는 데이터!!           ==> contains
-----> 'a',  'ab', 'ad', 'abc',  'abbbbb',  'bababa'


### <ORDER BY절>

- 정렬하여 출력

형식)
select 컬럼명
from   테이블명
where  조건식
ORDER BY (정렬하고자 하는)컬럼명 [ASC|DESC];

- --> ASC (ascending) : 오름차순 정렬(기본값!!) abcde 012345 가나다라
---> DESC(descending) : 내림차순 정렬 edcba 543210 라다나가


### <NOT연산자>

- 조건에 만족하지 못하는 행을 검색.
- 위치: 조건식 앞에 사용
in, like, between 앞에 사용
null앞에 사용


### <그룹함수> ★ 집계함수

- 전체데이터를 그룹별로 구분하여 통계적인 결과를 구하기 위해 사용.
- 결과값은 항상 단행!!
- 그룹함수와 단순컬럼은 함께 사용하는 것이 불가능!!
(만약 그룹함수와 함께 사용하고자 하는 컬럼이 그룹으로 묶여질 수 있다면
group by절과 함께 사용하는 것이 가능)
- NULL은 결과값에서 제외

종류)
SUM(총합), AVG(평균), COUNT(행갯수), MIN(최소값), MAX(최대값)

형식)
그룹함수명(컬럼명)


### DQL형식)

1. select 조회컬럼명
2. from 테이블명
3. where (전체행에 대한)조건식
4. group by (그룹을 묶을 수 있는 조건을 가진)컬럼명
5. having (그룹에 대한)조건식
6. order by 정렬컬럼명;

★실행순서!!  :  2- 3- 4- 5- 1(조회)- 6  - 출력

select deptno, avg(sal)
from  emp
group by deptno;   -- 부서별로 그룹을 묶겠음!!
-- 그룹함수와 컬럼이 매핑할 근거 마련

```
DEPTNO   AVG(SAL)
    30 1566.66667
    20       2175
    10 2916.66667

==> 부서별 평균 급여

select deptno, avg(sal)
from  emp
group by deptno
order by 2 asc;
```


## <SQL> Structured Query Language

1. DQL(데이터 조회,검색,출력)
    - select
    
    DQL문법)
    
    ```
    1. select 컬럼명
    2. from   테이블명
    3. where  조건식
    4. group by 컬럼명
    5. having  조건식
    6. order by  컬럼명;
    ```
    
    실행순서) 2- 3- 4- 5- 1(DB로 부터의 조회,인출)- 6   - 1(정렬된 결과를 출력)
    
    ```
    select distinct 조회컬럼명1 [as] 별명,  concat(컬럼명2, 컬럼명3),  데이터, 산술연산, 함수호출(예: length(ename)), 그룹함수호출(count(),sum(),max(),min(),avg())
    
    //
     from   테이블명
     where  조건식
            ---------
                      컬럼명       연산자       데이터
                  -------
                                   비교연산자(>  <   >=   <=  =   !=  <>)
                  like      '패턴%_'
                  in        (value_list)
    
              예) deptno  in        (10,20,30)
           ==> deptno = 10  OR  deptno = 20  OR  deptno = 30
          ename   in        ('ADAMS','MILLER')
           ==> ename = 'ADAMS'  OR  ename = 'MILLER'
    
                  between  최소값 and 최대값
             예) sal >= 2000  and  sal<=3000
           sal    between  2000 and  3000           ==> 2000이상~ 3000이하
           sal    not between  2000 and  3000       ==> 2000미만, 3000초과
      not  sal    between  2000 and  3000           ==> 2000미만, 3000초과
    
                    =      null    (실행결과 없음)
                    is     null    (컬럼의 값이 null과 같다면)
                    is  not null    (컬럼의 값이 null과 같지않다면)
                    
    **<부정연산자>**
     not 조건식
     not (조건식1 or 조건식2)
     not in
     not like
     not between 최소값 and 최대값
    
     group by (그룹묶을수 있는)컬럼명
                 예)  group by  deptno
              ===> (10번부서의 사원들)   (20번부서의 사원들) (30번부서의 사원들)
    
     having  (그룹에 대한) 조건식
             ===> group by와 반드시 함께 사용!!
             ===> deptno = 10            : 3개의 그룹중 (10번부서의 사원들만)
                  avg(sal) >= 2000       : 10번,20번,30번 부서 각각의 평균 급여를 비교
                                          ---- ---- ----
                                    (사원3명 급여 더하기/3)
                                        (사원5명 급여 더하기/5)
                                              (사원6명 급여 더하기/6)
     order by  (정렬할 )컬럼명  [ASC|DESC];
    
                              컬럼명1, 컬럼명2
               ------ -------
               1차정렬    1차정렬결과에 대한 2차정렬
    
    ```
