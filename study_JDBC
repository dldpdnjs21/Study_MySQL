package com.ureca;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCTest {
	public static void main(String[] args) throws Exception {
//		1. 제품군 선택(Driver Loading)
//		Class.forName("드라이버 클래스명");
		Class.forName("com.mysql.cj.jdbc.Driver");
		
//		2. 연결객체 생성
//		Connection conn = DriverManager.getConnection(String url, String user, String password);
		String url="jdbc:mysql://127.0.0.1:3306/ureca?serverTimezone=UTC&useUniCode=yes&characterEncoding=UTF-8";
		Connection conn = DriverManager.getConnection(url,
													"ureca", "0000");
		System.out.println("DB연결 성공");
		
//		3. 실행(문장)객체 생성
		Statement stmt = conn.createStatement();
//		String sql = "insert into dept(deptno, dname, loc) values (50,'IT','서울')";
//		String sql = "insert into dept values (50,'IT','서울')";
		String sql = "insert into dept values (60,'자재부','대전')";
		
		int rowCnt = stmt.executeUpdate(sql);//DB서버에게 sql문을 실행해 달라는 요청
		System.out.println("rowCnt(입력된 행의 개수)>>>"+rowCnt);
//		미션 2) 20번 부서의 근무하는 사원의 사원번호, 사원명, 급여를 출력하시오.
//		4. 결과 집합 객체 생성
		sql = "select empno, ename, sal from emp where deptno=20";
//		인덱스 			1	   2	 3
//		stmt.executeQuery(String sql);
//		stmt.executeQuery("sql문장(select)");//실행 요청하는 명령문이 select일때 사용
//		==> 결과값: ResutSet  ==> 의미 : 조회한 결과(행열)집합
		ResultSet rs = stmt.executeQuery(sql);
		
//		4-1 행데이터 얻기	rs.next() : 얻어올 행이 존재한다면 true 리턴
		while(rs.next()) {
			System.out.println("사원번호:"+rs.getInt(1));
			System.out.println("사원명:"+rs.getString(2));
			System.out.println("급여:"+rs.getInt(3));
//			System.out.println("사원번호:"+rs.getInt("empno"));
//			System.out.println("사원명:"+rs.getString("ename"));
//			System.out.println("급여:"+rs.getInt("sal"));
		}
		
//		4-2 행안의 열데이터 뽑아오기	rs.getString("컬럼명")	rs.getInt(조회 인덱스)		rs.getDate()
		
		
		
//		System.out.println("-----END-----");
	}//main
}//end class
