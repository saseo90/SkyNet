package it.net.sky.join;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import it.net.sky.join.vo.JoinVo;

public class JoinVoValidator implements Validator{

	@Override
	public boolean supports(Class<?> info) {
		return JoinVo.class.isAssignableFrom(info);
	}

	@Override
	public void validate(Object target, Errors errors) {
		JoinVo info = (JoinVo) target;
		
		if(info.getMember_enum() == null || info.getMember_enum().trim().isEmpty())
		{
			errors.rejectValue("member_enum", "사원번호는 필수항목입니다.uu");
		}
		if(info.getMember_regdate() == null || info.getMember_regdate().trim().isEmpty())
		{
			errors.rejectValue("member_regdate", "입사일은 필수항목입니다.uu");
		}
		if(info.getMember_name() == null || info.getMember_name().trim().isEmpty())
		{
			errors.rejectValue("member_name", "이름은 필수항목입니다.uu");
		}
		if(info.getMember_pass() == null || info.getMember_pass().trim().isEmpty())
		{
			errors.rejectValue("member_name", "암호는 필수항목입니다.uu");
		}
		if(info.getMember_email() == null || info.getMember_email().trim().isEmpty())
		{
			errors.rejectValue("member_name", "이메일은 필수항목입니다.uu");
		}
		if(info.getMember_birth() == null || info.getMember_birth().trim().isEmpty())
		{
			errors.rejectValue("member_name", "생년월일은 필수항목입니다.uu");
		}
		if(info.getMember_adress() == null || info.getMember_adress().trim().isEmpty())
		{
			errors.rejectValue("member_name", "주소는 필수항목입니다.uu");
		}
		if(info.getMember_phone() == null || info.getMember_phone().trim().isEmpty())
		{
			errors.rejectValue("member_name", "전화번호는 필수항목입니다.uu");
		}
		
		errors.popNestedPath();
	}
}
