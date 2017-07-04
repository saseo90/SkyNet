package it.net.sky.survey.vo;

import java.util.Arrays;
import java.util.List;

public class SurveyVo {

	private int survey_num; 				// 번호
	private String survey_title; 			// 설문 제목
	private String survey_content; 			// 설문 내용
	private String survey_writer; 			// 작성자
	private String survey_start; 			// 시작일(작성일)
	private String survey_end; 				// 종료일
	private String survey_state; 			// 설문 상태 (진행중, 완료)
	private String survey_count; 			// 응답 수

	private String Question; 				// 질문지 내용
	private String[] chkList; 				// 선택지 리스트
	private List<SurveyInfoVo> infoList; 	// 응답 리스트
	@Override
	public String toString() {
		return "SurveyVo [survey_num=" + survey_num + ", survey_title=" + survey_title + ", survey_content="
				+ survey_content + ", survey_writer=" + survey_writer + ", survey_start=" + survey_start
				+ ", survey_end=" + survey_end + ", survey_state=" + survey_state + ", survey_count=" + survey_count
				+ ", Question=" + Question + ", chkList=" + Arrays.toString(chkList) + ", infoList=" + infoList + "]";
	}
	public int getSurvey_num() {
		return survey_num;
	}
	public void setSurvey_num(int survey_num) {
		this.survey_num = survey_num;
	}
	public String getSurvey_title() {
		return survey_title;
	}
	public void setSurvey_title(String survey_title) {
		this.survey_title = survey_title;
	}
	public String getSurvey_content() {
		return survey_content;
	}
	public void setSurvey_content(String survey_content) {
		this.survey_content = survey_content;
	}
	public String getSurvey_writer() {
		return survey_writer;
	}
	public void setSurvey_writer(String survey_writer) {
		this.survey_writer = survey_writer;
	}
	public String getSurvey_start() {
		return survey_start;
	}
	public void setSurvey_start(String survey_start) {
		this.survey_start = survey_start;
	}
	public String getSurvey_end() {
		return survey_end;
	}
	public void setSurvey_end(String survey_end) {
		this.survey_end = survey_end;
	}
	public String getSurvey_state() {
		return survey_state;
	}
	public void setSurvey_state(String survey_state) {
		this.survey_state = survey_state;
	}
	public String getSurvey_count() {
		return survey_count;
	}
	public void setSurvey_count(String survey_count) {
		this.survey_count = survey_count;
	}
	public String getQuestion() {
		return Question;
	}
	public void setQuestion(String question) {
		Question = question;
	}
	public String[] getChkList() {
		return chkList;
	}
	public void setChkList(String[] chkList) {
		this.chkList = chkList;
	}
	public List<SurveyInfoVo> getInfoList() {
		return infoList;
	}
	public void setInfoList(List<SurveyInfoVo> infoList) {
		this.infoList = infoList;
	}

	
	
	
	

}