package com.hb.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

// DB처리하는 클래스
public class DAO {
	private static SqlSession ss;
	
	// 싱글턴 패턴
	private synchronized static SqlSession getSql(){
		if(ss == null){
			ss = DBService.getFactory().openSession();
		}
		return ss ;
	}
	
	// 전체 게시물의 수  구하기
	public static int getTotalCount(){
		return getSql().selectOne("totalCount");
	}
	
	// DB처리하는 메소드 
	// 원글 리스트 처리
	public static List<BVO> getList(Map<String, Integer> map){
		return getSql().selectList("list",map);
	}
	
	// 원글 삽입
	public static void getInsert(BVO bvo){
		getSql().insert("insert",bvo);
		ss.commit();
	}
	
	// 원글 내용 가져오기
	public static BVO getOnelist(String b_idx){
		return getSql().selectOne("onelist", b_idx);
	}
	
	// 원글 히트 업데이트
	public static void getHit(BVO bvo){
		getSql().update("hit", bvo);
		ss.commit();
	}
	
	// 원글 삭제
	public static void getDelete(String b_idx){
		// 댓글을 삭제 후 원글 삭제
		 getSql().delete("ans_Delete_all",b_idx);
    	 getSql().delete("delete",b_idx);
    	 ss.commit();
	}
	
	// 댓글 리스트 가져오기
	public static List<CVO> getAns_list(String b_idx){
		return getSql().selectList("ans_list", b_idx);
	}
	
	// 댓글 삽입 
	public static void getAns_Insert(CVO cvo){
		getSql().insert("ans_insert", cvo);
		ss.commit();
	}
	
	// 댓글 삭제
	public static void getAns_Delete(String c_idx){
		getSql().delete("ans_Delete",c_idx );
		ss.commit();
	}
	
	//원글 업데이트(File이름이 null이 아닌 경우)
	public static void getUpdate1(BVO bvo){
		getSql().delete("update1",bvo );
		ss.commit();
	}
	//원글 업데이트(File이름이 null인 경우)
	public static void getUpdate2(BVO bvo){
		getSql().delete("update2",bvo );
		ss.commit();
	}
	
}











