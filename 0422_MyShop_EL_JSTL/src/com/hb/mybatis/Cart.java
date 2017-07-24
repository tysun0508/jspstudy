package com.hb.mybatis;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<VO> list; //  카트에 담겨질 제품리스트
	private int total; // 카트에 전체 금액
	
	public Cart() { list = new ArrayList<>();}
	
	// 카트에 해당 제품이 있는지 검색하는 메소드
	public VO findProduct(String p_num){
		VO vo = null;
		for(VO k :list){
			if(k.getP_num().equals(p_num)){
				vo = k;
			}
		}
		return vo;
	}
	
	public void addProduct(String p_num){
		// 카트에서 존재한 제품 찾기
		// 존재하면 수량증가, 존재하지 않으면 list에 추가
		VO vo = findProduct(p_num);
		if(vo != null){ // 존재하면
			vo.setQuant(vo.getQuant()+1);
			total = total + vo.getP_saleprice();
		}else{ // 존재하지 않으면
		   	vo = DAO.findProduct(p_num);
		   	vo.setQuant(1);
		   	total = total + vo.getP_saleprice();
		   	list.add(vo);
		}
	}
	
	// 카트에 존재하는 제품 제거하는 메소드
	public void deleteProduct(String p_num){
		VO vo = findProduct(p_num);
		if(vo != null){
			list.remove(vo);
			total = total - vo.getTotalprice();
		}
	}
	
	// 수량 받어서 변경하는 메소드
	public void setQuant(String p_num, int su){
		VO vo = findProduct(p_num);
		if(vo != null){
			total = total - vo.getTotalprice();
			vo.setQuant(su);
			total = total + vo.getTotalprice();
		}
	}
	
	// 총액 반환
	public int getTotal(){return total;}
	
	// 카트리스트 반환
	public List<VO> getList(){return list;}
}
















