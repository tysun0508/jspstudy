package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	Connection conn = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	
	private DAO(){	}
	
	private static DAO dao = new DAO();
	
	public static DAO getInstance(){
		return dao;
	}
	
	private static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "1111");
		return conn;		
	}
	
	public String getCustNum(){
		String custNum = "";
		try {
			conn = getConnection();
			String sql = "select max(custno)+1 as custno from member_tbl_02";
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while(rs.next()){
				custNum = rs.getString("custno");
			}			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return custNum;
	}
	
	public List<MemberVO> getList(){
		ArrayList<MemberVO> list = new ArrayList<>();
		try {
			conn = getConnection();
			String sql = "select * from member_tbl_02";
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while(rs.next()){
				MemberVO vo = new MemberVO();
				vo.setCustno(rs.getString(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getString(5));				
				String grade = rs.getString(6);
				if(grade.equalsIgnoreCase("A")){
					vo.setGrade("VIP");
				}else if(grade.equalsIgnoreCase("B")){
					vo.setGrade("일반");
				}else if(grade.equalsIgnoreCase("C")){
					vo.setGrade("직원");
				}				
				vo.setCity(rs.getString(7));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return list;	
	}
	
	public int getInsert(MemberVO vo){
		int res = 0;
		try {
			conn = getConnection();
			String sql = "insert into member_tbl_02 values(custno_seq.nextval, ?, ?, ?, sysdate, ?, ?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, vo.getCustname());
			pstm.setString(2, vo.getPhone());
			pstm.setString(3, vo.getAddress());
			pstm.setString(4, vo.getGrade());
			pstm.setString(5, vo.getCity());
			res = pstm.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			System.out.println(e);
		} finally{
			try {
				pstm.close();
				conn.close();
			} catch (Exception e2) {			
			}
		}
		return res;
	}
	
	public MemberVO getModify(String custNum){
		MemberVO vo = new MemberVO();
		try {			
			conn = getConnection();
			String sql = "select * from member_tbl_02 where custno = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, custNum);
			rs = pstm.executeQuery();
			while(rs.next()){				
				vo.setCustno(rs.getString(1));
				vo.setCustname(rs.getString(2));
				vo.setPhone(rs.getString(3));
				vo.setAddress(rs.getString(4));
				vo.setJoindate(rs.getString(5));
				vo.setGrade(rs.getString(6));
				vo.setCity(rs.getString(7));			
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return vo;
	}
	
	public int getUpdate(MemberVO vo){		
		System.out.println(vo.getCustno());
		System.out.println(vo.getCustname());
		int res = 0;
		try {
			conn = getConnection();
			String sql = "update member_tbl_02 set custname = ?, phone = ?, address = ?, grade = ?, city = ? where custno = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, vo.getCustname());
			pstm.setString(2, vo.getPhone());
			pstm.setString(3, vo.getAddress());
			pstm.setString(4, vo.getGrade());
			pstm.setString(5, vo.getCity());
			pstm.setString(6, vo.getCustno());
			res = pstm.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			System.out.println(e);
		} finally{
			try {
				pstm.close();
				conn.close();
			} catch (Exception e2) {			
			}
		}
		return res;
	}
	
	public List<SalesVO> getSales(){
		List<SalesVO> salelist = new ArrayList<>();		
		try {
			conn = getConnection();
			String sql = "Select M1.Custno Custno, M1.Custname Custname, M1.Grade Grade, M2.Price2 Price "
					+ "From Member_Tbl_02 M1, (Select Custno, Sum(Price) Price2 From Money_Tbl_02 Group By Custno) M2 where M1.Custno = M2.Custno Order By Price desc";
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			while(rs.next()){
				SalesVO sales = new SalesVO(); //새 CVO 생성
				sales.setCustno(rs.getString("custno"));
				sales.setCustname(rs.getString("custname"));
				String grade = rs.getString("grade");
					if(grade.equalsIgnoreCase("A")){
						sales.setGrade("VIP");
					}else if(grade.equalsIgnoreCase("B")){
						sales.setGrade("일반");
					}else if(grade.equalsIgnoreCase("C")){
						sales.setGrade("직원");
					}
				sales.setPrice(rs.getString("price"));
				System.out.println(sales.toString());
				salelist.add(sales); //리스트 추가
			}
		} catch (Exception e) {
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return salelist;
	}
	
}
