package biz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import biz.vo.GhblListVO;
import biz.vo.GhblViewVO;

public class GhblRentDAO {
	// 커넥션 풀 사용 오라클 DB 접속 메서드
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	// DB 접속 메서드
	public void dbConn() {
		try {
			Context initctx = new InitialContext();
			System.out.println("1.Context 생성 성공!!");
			Context envctx = (Context)initctx.lookup("java:comp/env");
			System.out.println("2.Context 환경생성 성공!!");
			DataSource ds = (DataSource)envctx.lookup("jdbc/pool");
			System.out.println("3.DataSource 찾기 성공!!");
			conn = ds.getConnection();
			System.out.println("4. DB접속 성공!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//회원가입
	public void insertMember(GhblViewVO bean) {
		dbConn();
		try {
			String sql = "insert into moviereserve(id,password)values(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPassword());
			
			pstmt.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	
	   // 세션을 이용한 로그인 메서드
	   public int getMember(String id, String pass) {
	      // 결괏값이 0이면 회원없음
	      int result = 0;
	      dbConn();
	      try {
	         String sql = "select count(*) from moviereserve where id=? and password=?";
	         pstmt = conn.prepareStatement(sql);
	         // ??
	         pstmt.setString(1, id);
	         pstmt.setString(2, pass);
	         // 결과 리턴
	         rs = pstmt.executeQuery();
	         
	         // 만약 결괏값이 있으면
	         if(rs.next()) {
	            // 0 또는 1이 저장됨, 위의 rs에 리턴의 첫번째값만 있음. count때문에 0또는1만 옴
	            result = rs.getInt(1); 
	         }
	         rs.close();
	         pstmt.close();
	         conn.close();
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return result;   
	   }
	
	   
	   
	   GhblListVO bean;
	   // 모든 영화를 검색하는 메서드
	   public ArrayList<GhblListVO> getAllMovie() {
	      ArrayList<GhblListVO> v = new ArrayList<>();
	      bean = null;
	      
	      dbConn();
	      
	      try {
	         String sql = "select * from movierent";
	         pstmt = conn.prepareStatement(sql);
	         
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            GhblListVO bean = new GhblListVO();
	            bean.setNo(rs.getInt(1));
	            bean.setName(rs.getString(2));
	            bean.setCategory(rs.getInt(3));
	            bean.setPrice(rs.getInt(4));
	            bean.setUsepeople(rs.getInt(5));
	            bean.setCompany(rs.getString(6));
	            bean.setImg(rs.getString(7));
	            bean.setInfo(rs.getString(8));
	            
	            v.add(bean);
	         }
	         rs.close();
	         pstmt.close();
	         conn.close();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return v;
	   }
	   
	   //하나의 영화정보 가져오기
	   public GhblListVO getOneMovie(int no) {
		   GhblListVO bean = new GhblListVO();
		   dbConn();
		   try {
			   String sql = "select * from movierent where no = ?";
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setInt(1, no);
			   rs = pstmt.executeQuery();
			   while (rs.next()) {
				   bean = new GhblListVO();
				   bean.setNo(rs.getInt(1));
		           bean.setName(rs.getString(2));
		           bean.setCategory(rs.getInt(3));
		           bean.setPrice(rs.getInt(4));
		           bean.setUsepeople(rs.getInt(5));
		           bean.setCompany(rs.getString(6));
		           bean.setImg(rs.getString(7));
		           bean.setInfo(rs.getString(8));
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			   
			   
		} catch (Exception e) {
			e.printStackTrace();
		}
		   
		return bean;   
	   }
	   
	   // 키워드 검색 메서드
	   public ArrayList<GhblListVO> getSearchMovie(String searchField, String searchText) {
	      ArrayList<GhblListVO> list = new ArrayList<>();
	      // db접속
	      dbConn();
	      try {
	         String sql = "select * from movierent where "+searchField.trim();
	         if(searchText != null && !searchText.equals("")) {
	            sql += " like '%"+searchText.trim()+"%' order by no desc";
	         }
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            GhblListVO bean = new GhblListVO();
	            bean.setNo(rs.getInt(1));
	            bean.setName(rs.getString(2));
	            bean.setCategory(rs.getInt(3));
	            bean.setPrice(rs.getInt(4));
	            bean.setUsepeople(rs.getInt(5));
	            bean.setCompany(rs.getString(6));
	            bean.setImg(rs.getString(7));
	            bean.setInfo(rs.getString(8));
	            // 배열객체에 빈클래스 저장
	            list.add(bean);   
	         }
	         rs.close();
	         pstmt.close();
	         conn.close();
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	   }
	   // 예약 확인 페이지
	   // 회원의 예약정보 리턴 메소드
	   public ArrayList<GhblViewVO> getAllReserve(String id) {
	      ArrayList<GhblViewVO>  v = new ArrayList<>();
	      GhblViewVO bean = null;
	      dbConn();
	      
	      try {
	         /*
	            예약 확인 페이지 (조인을 이용한 쿼리)
	            SQL Join문을 이용하여 공통의 컬럼을 기준으로 두 테이블을 묶어줌
	            : 훨씬 합리적이고 DB를 이용하여 필요한 데이터를 가져옴
	              natural join 사용함 
	         */
	         // 조건절 현재시스템보다 크면 rDay는 문자열이므로 날짜형으로 바꿈
	         String sql = "select * from movierent natural join moviereserve where sysdate < to_date(rday,'YYYYMMDD') AND id= ?";
	         pstmt = conn.prepareStatement(sql);
	         // ??
	         pstmt.setString(1, id);
	         // 결과
	         rs = pstmt.executeQuery();
	         // 해당 id면 나머지 정보도 가져오기
	         while(rs.next()) {
	            bean = new GhblViewVO();
	            // (중요) 1번부터 아니고 위의 sql결과컬럼에서 해당 순서로 가져오기
	            bean.setName(rs.getString(2));
	             bean.setPrice(rs.getInt(4));
	             bean.setImg(rs.getString(7));
	             bean.setQty(rs.getInt(11));
	             bean.setDday(rs.getInt(12));
	             bean.setRday(rs.getString(13));
	             bean.setUserin(rs.getInt(14));
	             bean.setUsewifi(rs.getInt(15));
	             bean.setUsenavi(rs.getInt(16));
	             bean.setUseseat(rs.getInt(17));
	             
	             // 빈 클래스 벡터에 저장
	             v.add(bean);
	         }
	         rs.close();
	         pstmt.close();
	         conn.close();
	         
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      // 리턴
	      return v;
	   }
	
	
	
	
	
	
	
}
