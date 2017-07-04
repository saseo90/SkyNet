package it.net.sky.stats.vo;

public class StatsVo {

	private String ST_PRODUCT;	// 1. 제품명
	private String ST_YEAR;		// 2. 판매년도
	private String ST_MONTH;	// 3. 판매월
	private int ST_SALECOUNT;// 4. 판매수량
	private int ST_SALES;	// 5. 판매액
	private int ST_PROFIT;	// 6. 순이익
	
	public String getST_PRODUCT() {
		return ST_PRODUCT;
	}
	public void setST_PRODUCT(String sT_PRODUCT) {
		ST_PRODUCT = sT_PRODUCT;
	}
	public String getST_YEAR() {
		return ST_YEAR;
	}
	public void setST_YEAR(String sT_YEAR) {
		ST_YEAR = sT_YEAR;
	}
	public String getST_MONTH() {
		return ST_MONTH;
	}
	public void setST_MONTH(String sT_MONTH) {
		ST_MONTH = sT_MONTH;
	}
	public int getST_SALECOUNT() {
		return ST_SALECOUNT;
	}
	public void setST_SALECOUNT(int sT_SALECOUNT) {
		ST_SALECOUNT = sT_SALECOUNT;
	}
	public int getST_SALES() {
		return ST_SALES;
	}
	public void setST_SALES(int sT_SALES) {
		ST_SALES = sT_SALES;
	}
	public int getST_PROFIT() {
		return ST_PROFIT;
	}
	public void setST_PROFIT(int sT_PROFIT) {
		ST_PROFIT = sT_PROFIT;
	}
	@Override
	public String toString() {
		return "StatsVo [ST_PRODUCT=" + ST_PRODUCT + ", ST_YEAR=" + ST_YEAR + ", ST_MONTH=" + ST_MONTH
				+ ", ST_SALECOUNT=" + ST_SALECOUNT + ", ST_SALES=" + ST_SALES + ", ST_PROFIT=" + ST_PROFIT + "]";
	}
	
	
}
