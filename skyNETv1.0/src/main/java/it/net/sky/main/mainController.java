package it.net.sky.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import it.net.sky.businessCard.service.BusinessCardService;
import it.net.sky.businessCard.vo.BusinessCardVo;
import it.net.sky.custommenu.service.CustomMainService;
import it.net.sky.custommenu.service.CustommenuService;
import it.net.sky.custommenu.vo.CustomMainHTMLVo;
import it.net.sky.custommenu.vo.CustommenuVo;
import it.net.sky.login.service.LoginService;
import it.net.sky.login.vo.LoginVo;
import it.net.sky.member.service.MemberService;
import it.net.sky.member.vo.MemberVo;
import it.net.sky.notice.service.NoticeService;
import it.net.sky.notice.vo.NoticeVo;
import it.net.sky.post.sercvice.PostService;
import it.net.sky.post.vo.PostVo;
import it.net.sky.report.service.ReportService;
import it.net.sky.suggest.service.AnswerService;
import it.net.sky.suggest.service.SuggestService;
import it.net.sky.suggest.vo.SuggestVo;
import it.net.sky.survey.service.SurveyService;
import it.net.sky.survey.vo.SurveyVo;
import it.net.sky.util.commons.codec.CodecUtil;
import it.net.sky.util.session.SessionUtil;
import it.net.sky.video.service.VideoTrainService;
import it.net.sky.video.vo.VideoBoardVo;

@Controller
public class mainController {
	@Resource(name = "loginService")
	LoginService login;

	@Resource(name = "businessCardService")
	BusinessCardService businesscard;

	// �떎�젙 : 嫄댁쓽�궗�빆 怨듭��뀉�뀖�빆 �뙎湲�
	@Resource(name = "noticeService")
	NoticeService Nservice;
	@Resource(name = "suggestService")
	SuggestService Sservice;
	@Resource(name = "answerService")
	AnswerService Anservice;

	@Resource(name = "memberService")
	MemberService Mservice;
	@Resource(name = "reportService")
	ReportService rservice;
	@Resource(name = "postService")
	PostService postService;

	@Resource(name = "custommenuService")
	CustommenuService customservice;
	@Resource(name = "customMainService")
	CustomMainService customMainService;

	@Resource(name = "surveyService")
	SurveyService surveyService;
	@Resource(name = "videoTrainService")
	VideoTrainService vservice;

	@RequestMapping(value = { "/main", "/" })
	public String main(Model model) {

		List<CustommenuVo> custommenu = null;

		int memberCount = 0;
		String member_department = "";

		try {
			if (SessionUtil.getAttribute("id") == null) {
				return "login";
			} else {
				member_department = (String) SessionUtil.getAttribute("id");
				// Main-content�쓽 �긽�떒 �궗�썝 移댁슫�듃
				memberCount = Mservice.listAll().size();
				model.addAttribute("memberCount", memberCount);
				List<Integer> list = rservice.stateList(member_department);
				model.addAttribute("reportWait", list.get(0));
				model.addAttribute("reportEnd", list.get(1));
				model.addAttribute("reportBack", list.get(2));

				// 而ㅼ뒪�꽣 留덉씠吏뺥븳 硫붾돱由ъ뒪�듃
				String id = (String) SessionUtil.getAttribute("id");
				custommenu = customservice.selectCustommenuList(id);
				SessionUtil.setAttribute("custommenu", custommenu);

				// �젒�냽�븳 �궗�슜�옄�쓽 �씠誘몄� 酉�
				String profileImg = login.profileImg(id);
				SessionUtil.setAttribute("profileImg", profileImg);
				// 而ㅼ뒪�꽣留덉씠吏� htmlcode
				Map<String, List<CustomMainHTMLVo>> htmlCodeMap = customMainService.getHTMLList(id);
				model.addAttribute("mianHhtmlRight", htmlCodeMap.get("right"));
				model.addAttribute("mianHhtmlLeft", htmlCodeMap.get("left"));
				return "index";
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "index";
	}

	@RequestMapping(value = { "/main", "/" }, method = RequestMethod.POST)
	public String checkId(LoginVo vo) {
		try {
			CodecUtil cu = new CodecUtil();
			String encode = cu.aesEncode(vo.getMember_pass()); // 인코딩
			vo.setMember_pass(encode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		LoginVo checkId = login.loginCheckID(vo);

		if (checkId != null) {
			try {
				SessionUtil.setAttribute("id", checkId.getMember_enum());
				SessionUtil.setAttribute("name", checkId.getMember_name());
				SessionUtil.setAttribute("businessCard", businesscard.getCard(checkId.getMember_enum()));
				SessionUtil.setAttribute("login", checkId);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "redirect:/";
	}

	@RequestMapping(value = "/test")
	public String getReprot(String page, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		return "report/reportEditor";
	}

	@RequestMapping(value = "/profile")
	public String getProfile(String page, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		return "profile";
	}

	@RequestMapping(value = "/suggest")
	public String getSuggest(String page, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		return "suggest";
	}

	@RequestMapping(value = "/businesscard/add", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> createBusinessCard(BusinessCardVo vo, HttpServletResponse response) {
		Map<String, Object> json = new HashMap<>();
		try {
			vo.setBusiness_RegId((String) SessionUtil.getAttribute("id"));
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			businesscard.createCard(vo);
			SessionUtil.removeAttribute("businessCard");
			SessionUtil.setAttribute("businessCard", businesscard.getCard((String) SessionUtil.getAttribute("id")));
			json.put("state", "sucesse");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			json.put("state", "fail");
		}
		return json;
	}

	@RequestMapping(value = "/businesscard/remove", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> removeBusinessCard(int business_seq, HttpServletResponse response) {
		Map<String, Object> json = new HashMap<>();

		try {
			businesscard.removeCard(business_seq);
			SessionUtil.removeAttribute("businessCard");
			SessionUtil.setAttribute("businessCard", businesscard.getCard((String) SessionUtil.getAttribute("id")));
			json.put("state", "sucesse");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			json.put("state", "fail");
		}
		return json;
	}

	@RequestMapping(value = "/main/getdata", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getData() {
		Map<String, Object> json = new HashMap<>();
		Map<String, Object> dataList = new HashMap<>();
		List<NoticeVo> notice = null;
		List<MemberVo> member = null;
		List<SuggestVo> suggest = null;
		List<PostVo> memo = null;
		String id = null;
		List<SurveyVo> survey = null;
		List<VideoBoardVo> video = null;
		Map<String, Integer> videomap = null;

		try {
			// Main-content�뿉 怨듭��궗�빆 由ъ뒪�듃 議고쉶
			id = (String) SessionUtil.getAttribute("id");
			notice = Nservice.getNoticeList();
			memo = postService.selectList((LoginVo) SessionUtil.getAttribute("login"));
			member = Mservice.listDepart(id);
			suggest = Sservice.listAll();
			surveyService.updateState();
			survey = surveyService.getMainList(id);
			video = vservice.selectvideo(id);
			videomap = vservice.selectcount(id);

			dataList.put("memo", memo);
			dataList.put("notice", notice);
			dataList.put("member", member);
			dataList.put("suggest", suggest);
			dataList.put("survey", survey);
			json.put("data", dataList);
			json.put("state", "sucesse");
			dataList.put("video", video);
			dataList.put("videomap", videomap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			json.clear();
			json.put("state", "fail");
		}

		return json;
	}

}
