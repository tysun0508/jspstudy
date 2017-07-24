package com.hb.am;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex09_3 implements Ex09_1 {
	
	// 오늘 날짜
	@Override
	public String play(HttpServletRequest request, HttpServletResponse response) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DATE);
		return year+"."+month+"."+day+".";
	}

}
