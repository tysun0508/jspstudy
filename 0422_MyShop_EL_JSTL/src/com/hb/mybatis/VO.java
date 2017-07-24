package com.hb.mybatis;

public class VO {
	private String category, p_num, p_name, p_company, p_image_s, p_image_l, p_content, p_date;
	private int num, p_price, p_saleprice; 
	// 추가(장바구니)
	private int quant, totalprice;
	
	// 세일가격으로 세일 퍼센트 계산
	public int getPercent(){
		float per = (p_price - p_saleprice)*100 / p_price;
		return (int)per;
	}
	
	// 수량이 변경되면 총금액도 변경된다.
	public void setQuant(int quant){
		this.quant = quant;
		setTotalprice(quant*p_saleprice);
	}
	
	public VO() {}

	public VO(String category, String p_num, String p_name, String p_company, String p_image_s, String p_image_l,
			String p_content, String p_date, int num, int p_price, int p_saleprice, int quant, int totalprice) {
		super();
		this.category = category;
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_company = p_company;
		this.p_image_s = p_image_s;
		this.p_image_l = p_image_l;
		this.p_content = p_content;
		this.p_date = p_date;
		this.num = num;
		this.p_price = p_price;
		this.p_saleprice = p_saleprice;
		this.quant = quant;
		this.totalprice = totalprice;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getP_num() {
		return p_num;
	}

	public void setP_num(String p_num) {
		this.p_num = p_num;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_company() {
		return p_company;
	}

	public void setP_company(String p_company) {
		this.p_company = p_company;
	}

	public String getP_image_s() {
		return p_image_s;
	}

	public void setP_image_s(String p_image_s) {
		this.p_image_s = p_image_s;
	}

	public String getP_image_l() {
		return p_image_l;
	}

	public void setP_image_l(String p_image_l) {
		this.p_image_l = p_image_l;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public String getP_date() {
		return p_date;
	}

	public void setP_date(String p_date) {
		this.p_date = p_date;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getP_saleprice() {
		return p_saleprice;
	}

	public void setP_saleprice(int p_saleprice) {
		this.p_saleprice = p_saleprice;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public int getQuant() {
		return quant;
	}
	
	
}
