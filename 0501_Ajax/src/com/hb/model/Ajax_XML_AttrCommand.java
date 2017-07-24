package com.hb.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;
import com.hb.mybatis.VO;

public class Ajax_XML_AttrCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer result =new StringBuffer();
		result.append("<?xml version='1.0' encoding='UTF-8' ?>");
		result.append("<members>");
		List<VO> list = DAO.getList();
		for(VO k : list){
			result.append("<member ");
			result.append(" idx='"+k.getIdx()+"'");
			result.append(" id='"+k.getId()+"'");
			result.append(" pwd='"+k.getPwd()+"'");
			result.append(" name='"+k.getName()+"'");
			result.append(" age='"+k.getAge()+"'");
			result.append(" addr='"+k.getAddr()+"'");
			result.append("  />");
		}
		result.append("</members>");
		return result.toString();
	}

}
