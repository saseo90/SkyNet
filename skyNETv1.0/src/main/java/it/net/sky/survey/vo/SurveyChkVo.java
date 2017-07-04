package it.net.sky.survey.vo;

public class SurveyChkVo {

	private int surveychk_gnum;				//설문지 번호
	private int surveychk_qnum;				//질문지 번호
	private String surveychk_qcontent;		//질문지 내용	
	private int surveychk_anum;				//선택지 순서
	private String surveychk_acontent;		//선택지 내용
	private int surveychk_count;			//선택지에 투표된 수
	
	
	
	@Override  
	public String toString() {
		return "SurveyChkVo [surveychk_gnum=" + surveychk_gnum + ", surveychk_qnum=" + surveychk_qnum
				+ ", surveychk_qcontent=" + surveychk_qcontent + ", surveychk_anum=" + surveychk_anum
				+ ", surveychk_acontent=" + surveychk_acontent + ", surveychk_count=" + surveychk_count + "]";
	}

	public int getSurveychk_gnum() {
		return surveychk_gnum;
	}

	public void setSurveychk_gnum(int surveychk_gnum) {
		this.surveychk_gnum = surveychk_gnum;
	}

	public int getSurveychk_qnum() {
		return surveychk_qnum;
	}

	public void setSurveychk_qnum(int surveychk_qnum) {
		this.surveychk_qnum = surveychk_qnum;
	}

	public String getSurveychk_qcontent() {
		return surveychk_qcontent;
	}

	public void setSurveychk_qcontent(String surveychk_qcontent) {
		this.surveychk_qcontent = surveychk_qcontent;
	}

	public int getSurveychk_anum() {
		return surveychk_anum;
	}

	public void setSurveychk_anum(int surveychk_anum) {
		this.surveychk_anum = surveychk_anum;
	}

	public String getSurveychk_acontent() {
		return surveychk_acontent;
	}

	public void setSurveychk_acontent(String surveychk_acontent) {
		this.surveychk_acontent = surveychk_acontent;
	}

	public int getSurveychk_count() {
		return surveychk_count;
	}

	public void setSurveychk_count(int surveychk_count) {
		this.surveychk_count = surveychk_count;
	}
	
			
	
}
