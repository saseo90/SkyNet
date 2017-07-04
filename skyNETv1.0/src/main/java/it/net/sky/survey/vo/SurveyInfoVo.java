package it.net.sky.survey.vo;

public class SurveyInfoVo {

	private int surveyinfo_gnum;			//설문 번호
	private int surveyinfo_qnum;			//질문 번호
	private String surveyinfo_member;		//응답 사원
	private int surveyinfo_chk;				//응답 결과
	@Override
	public String toString() {
		return "SurveyInfoVo [surveyinfo_gnum=" + surveyinfo_gnum + ", surveyinfo_qnum=" + surveyinfo_qnum
				+ ", surveyinfo_member=" + surveyinfo_member + ", surveyinfo_chk=" + surveyinfo_chk + "]";
	}
	public int getSurveyinfo_gnum() {
		return surveyinfo_gnum;
	}
	public void setSurveyinfo_gnum(int surveyinfo_gnum) {
		this.surveyinfo_gnum = surveyinfo_gnum;
	}
	public int getSurveyinfo_qnum() {
		return surveyinfo_qnum;
	}
	public void setSurveyinfo_qnum(int surveyinfo_qnum) {
		this.surveyinfo_qnum = surveyinfo_qnum;
	}
	public String getSurveyinfo_member() {
		return surveyinfo_member;
	}
	public void setSurveyinfo_member(String surveyinfo_member) {
		this.surveyinfo_member = surveyinfo_member;
	}
	public int getSurveyinfo_chk() {
		return surveyinfo_chk;
	}
	public void setSurveyinfo_chk(int surveyinfo_chk) {
		this.surveyinfo_chk = surveyinfo_chk;
	}
	
	
	
}
