-- for mysql
-- SET DATABASE SQL SYNTAX MYS TRUE;
-- for oracle
SET DATABASE SQL SYNTAX ORA TRUE;

--최종수정일 : 2016.10.07.
--수정일 : 2016.10.06. 20시
--수정일 : 2016.09.08. 21시
--규칙 : 테이블 및 칼럼 이름은 소문자 나머지 대문자
--0.삭제
--1.테이블 생성
--1.1.라벨코드(label)
--1.2.부서코드(departmentCode)
--1.3.직급코드(rankCode)
--1.4.사원관리(memberJoin)
--1.5.클라우드(cloud)
--1.6.그룹(맴버그룹)(memberGroup)
--1.7.클라우드그룹(cloudGroup)
--1.8.파일정보(fileInfo)
--1.9.파일이력(fileHistory)
--1.10.일정관리(calendar)
--1.11.전자결제(report)
--1.12.전자결제권한신청(connectReport)
--1.13.명함(BUSINESSCARD)   
--1.14.메모(POST)
--1.15.메시지(MESSAGE)
--1.16.설문조사(SURVEY)
--1.17.설문조사질문(SURVEYCHK)
--1.18.설문조사응답회원(SURVEYINFO)
--1.16.사용자정의메인(CUSTOMMAINLIST)
--1.17.사용자정의메인저장(CUSTOMMAINSAVE)
--1.18.사용자정의메뉴(MENU)
--1.19.사용자정의메뉴저장(CUSTOMMENU)
--1.20.건의사항(SUGGEST)
--1.21.건의사항댓글(SUGANS)
--1.22.공지사항(NOTICE)
--1.23.비디오시청이력(CONNECTVIDEO)
--1.24.비디오게시판(VIDEOBOARD)
--1.25.비디오정보(VIDEOINFO)

--1.23.통계(SALETABLE)

--2.외래키 추가 : FK_테이블이름_컬럼이름 
--2.1.회원관리 의 부서코드 와 부서코드의 부서코드
--2.2.회원관리 의 직급코드 와 직급코드의 직급코드
--2.3.클라우드 유저번호 와 회원관리 사원번호
--2.4.그룹    팀장 과 회원관리 사원번호 leader
--2.5.클라그룹 
--2.6.파일정보 소유자, 그룹번호 
--2.7.파일이력 파일번호, 원본파일번호 ,소유자번호 와 파일테이블
--2.8.일정     아이디와 회원아이디
--2.9.전자결제  등록자아이디 와 회원아이디 , 라벨번호 와 라벨번호
--2.10.전자결제권한 회원 ,전자결제(번호)
--2.11.메모 - 회원
--2.12.사용자정의메인저장 - 회원 ,사용자정의메인
--2.13.사용자정의메뉴저장 - 회원 ,사용자정의메뉴
--2.14.메시지 - 회원
--2.15.공지   - 회원
--2.16.건의   - 회원
--2.17.건의댓글 - 회원
--2.18.설문조사 - 회원
--2.19.설문조사질문 - 설문조사
--2.20.설문조사응답 - 설문조사 ,회원
--2.21.비디오정보    - 비디오게시판  ,회원
--2.22.비디오시청이력 - 회원,비디오게시판
--2.23.명함         - 회원

--3.시퀀스 생성
--3.1.라벨코드 PK_LABEL_NUM(label_num)
--3.2.부서코드 PK_RANKCODE_NO(rank_id)
--3.3.직급코드 PK_DEPARTMENT_NO(dep_id)
--3.4.회원관리 PK_MEMBERJOIN_NO(calendar_no)
--3.5.그룹    PK_MEMBERGROUP_NO(group_no)
--3.6.파일정보 PK_FILEINFO_NO (file_no)
--3.7.일정관리 PK_CALENDAR_NO (calendar_no)
--3.8.전자결제 PK_REP_REORT_NO(report_no)
--3.9.클라우드그룹 PK_CLOUDGORUP_SEQ()
--3.10.명함   PK_BUSINESS_NO(BUSINESS_SEQ)
--3.11.메모   PK_POST_NO(POSTNO)
--3.12.메시지 PK_MESSAGE_NO(msg_no)
--3.13.공지사항 PK_NOTICE_NUM(NOTICE_NUM)
--3.14.건의사항댓글 PK_SUGANS_NUM(ANS_NO)
--3.15.건의사항 PK_SUGGEST_NUM(SUG_NUM)
--3.16.설문조사 PK_SURVEY_NUM(SURVEY_NUM)
--3.19.비디오 게시판 PK_VIDEOBOARD_SEQ(BNUM)
--3.20.[비디오정보 사용예정]PK_VIDEOINFO_SEQ()

--4.기초데이터
--4.1.부서코드 기초데이터
--4.2.직급코드 기초데이터
--4.3.회원관리 기초데이터
--4.5.클라우드 기초데이터
--4.6.그룹    기초데이터
--4.7.클라우드_그룹 기초데이터






----0.삭제(생성의 반대순서로 삭제한다.)
--DROP TABLE BUSINESSCARD;
--DROP TABLE connectReport;
--DROP TABLE report;
--DROP TABLE calendar;
--DROP TABLE filehistory;
--DROP TABLE fileInfo;
--DROP TABLE cloudGroup;
--DROP TABLE memberGroup;
--DROP TABLE cloud;
--DROP TABLE label;
--DROP TABLE POST;
--DROP TABLE MESSAGE;
--DROP TABLE SURVEYINFO;
--DROP TABLE SURVEYCHK;
--DROP TABLE SURVEY;
--DROP TABLE CUSTOMMAINSAVE;
--DROP TABLE CUSTOMMAINLIST;
--DROP TABLE CUSTOMMENU;
--DROP TABLE MENU;
--DROP TABLE SUGANS;
--DROP TABLE SUGGEST;
--DROP TABLE NOTICE;
--DROP TABLE CONNECTVIDEO;
--DROP TABLE memberJoin;
--DROP TABLE rankCode;
--DROP TABLE departmentCode;
--DROP TABLE VIDEOINFO;
--DROP TABLE VIDEOBOARD;
--
--DROP SEQUENCE PK_MEMBERJOIN_NO;
--DROP SEQUENCE PK_MEMBERGROUP_NO;
--DROP SEQUENCE PK_FILEINFO_NO;
--DROP SEQUENCE PK_CALENDAR_NO;
--DROP SEQUENCE PK_REP_REORT_NO;
--DROP SEQUENCE PK_RANKCODE_NO;
--DROP SEQUENCE PK_DEPARTMENT_NO;
--DROP SEQUENCE PK_LABEL_NUM;
--DROP SEQUENCE PK_CLOUDGORUP_SEQ;
--DROP SEQUENCE PK_BUSINESS_NO;
--DROP SEQUENCE PK_POST_NO;
--DROP SEQUENCE PK_MESSAGE_NO;
--DROP SEQUENCE PK_NOTICE_NUM;
--DROP SEQUENCE PK_SUGANS_NUM;
--DROP SEQUENCE PK_SUGGEST_NUM;
--DROP SEQUENCE PK_SURVEY_NUM;
--DROP SEQUENCE PK_VIDEOBOARD_SEQ;
--DROP SEQUENCE PK_VIDEOINFO_SEQ;
--1.1.라벨코드(label)
CREATE TABLE label(
   label_num      NUMBER      NOT NULL PRIMARY KEY
  ,label_name     VARCHAR2(50)NOT NULL
  ,label_color    VARCHAR2(50)NOT NULL
  ,label_document NUMBER      DEFAULT 0
  ,label_gnum     NUMBER      DEFAULT 0
  ,label_onum     NUMBER      DEFAULT 0
  ,label_nested   NUMBER      DEFAULT 0
  ,reg_Id_label   VARCHAR2(10)NOT NULL
);
COMMENT ON COLUMN LABEL.label_num    IS '라벨번호';
COMMENT ON COLUMN LABEL.label_name   IS '라벨이름';
COMMENT ON COLUMN LABEL.label_color  IS '라벨색';
COMMENT ON COLUMN LABEL.label_document IS '라벨사용문서수';
COMMENT ON COLUMN LABEL.label_gnum   IS '라벨그룹번호';
COMMENT ON COLUMN LABEL.label_onum   IS '라벨순서번호';
COMMENT ON COLUMN LABEL.label_nested IS '라벨들여쓰기번호';
COMMENT ON COLUMN LABEL.reg_Id_label IS '라벨등록일';
--1.2.부서코드(departmentCode)
CREATE TABLE departmentCode(
   dep_id      NUMBER(3)    NOT NULL PRIMARY KEY
  ,dep_name    VARCHAR2(30) NOT NULL
);
COMMENT ON COLUMN departmentCode.dep_id   IS '부서코드';
COMMENT ON COLUMN departmentCode.dep_name IS '부서이름';
--1.3.직급코드(rankCode)
CREATE TABLE rankCode(
   rank_id     NUMBER(3)    NOT NULL PRIMARY KEY
  ,rank_name   VARCHAR2(30) NOT NULL
);
COMMENT ON COLUMN rankCode.rank_id   IS '직급코드';
COMMENT ON COLUMN rankCode.rank_name IS '직급이름';
--1.4.사원관리
CREATE TABLE memberJoin(
   member_enum       VARCHAR2(10)  NOT NULL PRIMARY KEY
  ,member_department NUMBER(3)
  ,member_rank       NUMBER(3)
  ,member_pass       VARCHAR2(30)  NOT NULL 
  ,member_email      VARCHAR2(50)  NOT NULL 
  ,member_phone      VARCHAR2(13)  NOT NULL 
  ,member_adress     VARCHAR2(200) NOT NULL 
  ,member_birth      VARCHAR2(8)   NOT NULL 
  ,member_profile    VARCHAR2(200) NOT NULL
  ,member_regdate         VARCHAR2(10)  NOT NULL
  ,member_resignationdate VARCHAR2(10)  NULL
  ,member_sign       VARCHAR2(200) NULL
  ,member_name       VARCHAR2(15)  NOT NULL 
);
COMMENT ON COLUMN memberJoin.member_enum    IS '사원 번호';
COMMENT ON COLUMN memberJoin.member_department IS '부서';
COMMENT ON COLUMN memberJoin.member_rank    IS '직급';
COMMENT ON COLUMN memberJoin.member_pass    IS '비밀번호';
COMMENT ON COLUMN memberJoin.member_email   IS '이메일';
COMMENT ON COLUMN memberJoin.member_phone   IS '전화번호';
COMMENT ON COLUMN memberJoin.member_adress  IS '주소';
COMMENT ON COLUMN memberJoin.member_birth   IS '생년월일';
COMMENT ON COLUMN memberJoin.member_profile IS '프로필사진';
COMMENT ON COLUMN memberJoin.member_regdate IS '입사일';
COMMENT ON COLUMN memberJoin.member_resignationdate IS '퇴사일';
COMMENT ON COLUMN memberJoin.member_sign    IS '결재도장';
COMMENT ON COLUMN memberJoin.member_name    IS '이름';
--1.5.클라우드
CREATE TABLE cloud(
     cloud_user        VARCHAR2(10)     NOT NULL PRIMARY KEY
    ,cloud_grade       NUMBER(2)        DEFAULT  0
    ,cloud_maxsize     NUMBER(5)       NOT NULL
    ,cloud_amount      NUMBER(5)       NOT NULL  
);
COMMENT ON COLUMN cloud.cloud_user    IS '유저번호';
COMMENT ON COLUMN cloud.cloud_grade   IS '등급';
COMMENT ON COLUMN cloud.cloud_maxsize IS '최대용량';
COMMENT ON COLUMN cloud.cloud_amount  IS '사용량';
--1.6.그룹(맴버그룹)
CREATE TABLE memberGroup(
     group_no         NUMBER            NOT NULL PRIMARY KEY
    ,group_type       NUMBER(1)         DEFAULT 0
    ,group_leader     VARCHAR2(10)      NOT NULL
    ,group_typename   VARCHAR2(30) NOT NULL
);
COMMENT ON COLUMN memberGroup.group_no       IS '그룹번호';
COMMENT ON COLUMN memberGroup.group_type     IS '그룹종류';
COMMENT ON COLUMN memberGroup.group_leader   IS '팀장';
COMMENT ON COLUMN memberGroup.group_typename IS '그룹종류이름';
--1.7.클라우드그룹
CREATE TABLE cloudGroup(
   group_seq        NUMBER(10)        NOT NULL PRIMARY KEY
    ,group_no         NUMBER            NOT NULL 
    ,cloud_user       VARCHAR2(10)      NOT NULL
    ,group_name       VARCHAR2(30)      NOT NULL
  ,group_regdate    DATE              DEFAULT SYSDATE
);
COMMENT ON COLUMN cloudGroup.group_seq     IS '그룹순서';
COMMENT ON COLUMN cloudGroup.group_no      IS '그룹번호';
COMMENT ON COLUMN cloudGroup.cloud_user    IS '클라우드번호';
COMMENT ON COLUMN cloudGroup.group_name    IS '그룹이름';
COMMENT ON COLUMN cloudGroup.group_regdate IS '그룹등록일';
--1.8.파일정보
CREATE TABLE fileInfo(
   file_no        NUMBER(10)       NOT NULL PRIMARY KEY
  ,group_seq      NUMBER(10)       NOT NULL
  ,file_group     NUMBER(10)       NOT NULL
    ,file_user      VARCHAR2(10)     NOT NULL
  ,file_directory VARCHAR2(200)    NOT NULL
  ,file_name      VARCHAR2(10)     NOT NULL
    ,file_oriname   VARCHAR2(30)     NOT NULL
    ,file_size      NUMBER(10)       NOT NULL
    ,file_type      VARCHAR2(10)     NOT NULL
    ,file_moddate   DATE             DEFAULT SYSDATE
    ,file_leaddate  DATE             DEFAULT SYSDATE
    ,file_regdate   DATE             DEFAULT SYSDATE
    ,file_note      VARCHAR2(30)     NULL
    ,file_del       NUMBER(1)        DEFAULT 0
);
COMMENT ON COLUMN fileInfo.file_no      IS '파일번호';
COMMENT ON COLUMN fileInfo.group_seq    IS '그룹순서';
COMMENT ON COLUMN fileInfo.file_user    IS '소유자';
COMMENT ON COLUMN fileInfo.file_group   IS '그룹번호';
COMMENT ON COLUMN fileInfo.file_directory IS '디렉토리 이름';
COMMENT ON COLUMN fileInfo.file_name    IS '파일이름';
COMMENT ON COLUMN fileInfo.file_oriname IS '파일원본이름';
COMMENT ON COLUMN fileInfo.file_size    IS '파일크기';
COMMENT ON COLUMN fileInfo.file_type    IS '파일종류';
COMMENT ON COLUMN fileInfo.file_modDate IS '수정일';
COMMENT ON COLUMN fileInfo.file_leadDate IS '조회일';
COMMENT ON COLUMN fileInfo.file_regDate IS '등록일';
COMMENT ON COLUMN fileInfo.file_note    IS '설명';
COMMENT ON COLUMN fileInfo.file_del     IS '삭제';
--1.9.파일이력
CREATE TABLE fileHistory(
     file_no       NUMBER(10)   NOT NULL
  ,file_user     VARCHAR2(10) NOT NULL
    ,file_orino    NUMBER(10)   NUll
  ,historycode   NUMBER(1)    DEFAULT 0
    ,file_moduser  VARCHAR2(10) NOT NULL
    ,file_moddate  DATE         DEFAULT SYSDATE
  ,file_oriname  VARCHAR2(10) NULL
);
COMMENT ON COLUMN fileHistory.file_no      IS '파일번호';
COMMENT ON COLUMN fileHistory.file_user    IS '소유자번호';
COMMENT ON COLUMN fileHistory.file_orino   IS '원본파일번호';
COMMENT ON COLUMN fileHistory.historyCode  IS '이력코드';
COMMENT ON COLUMN fileHistory.file_modUser IS '수정자유저번호';
COMMENT ON COLUMN fileHistory.file_modDate IS '수정일';
COMMENT ON COLUMN fileHistory.file_oriName IS '원본파일이름';
--1.10.일정관리
CREATE TABLE calendar(
    calendar_no      NUMBER(20)   NOT NULL PRIMARY KEY
   ,calendar_regid   VARCHAR2(10) NOT NULL
   ,calendar_regdate DATE         DEFAULT  SYSDATE
   ,calendar_start   DATE         NOT NULL
   ,calendar_end     DATE         NOT NULL
   ,calendar_title   VARCHAR2(30) NOT NULL
   ,calendar_cont    VARCHAR2(200)
   ,calendar_remark  VARCHAR2(200)
   ,calendar_color   VARCHAR2(7)
);
COMMENT ON COLUMN calendar.calendar_no      IS '일정 번호';
COMMENT ON COLUMN calendar.calendar_regid   IS '등록자사 ID(사원번호)';
COMMENT ON COLUMN calendar.calendar_regdate IS '등록일';
COMMENT ON COLUMN calendar.calendar_start   IS '일정 시작일';
COMMENT ON COLUMN calendar.calendar_end     IS '일정 종료일';
COMMENT ON COLUMN calendar.calendar_title   IS '일정 제목';
COMMENT ON COLUMN calendar.calendar_cont    IS '일정 내용';
COMMENT ON COLUMN calendar.calendar_remark  IS '기타사항';
COMMENT ON COLUMN calendar.calendar_color   IS '일정색';

--1.11.전자결제
CREATE TABLE report(
    report_no         VARCHAR2(10)  NOT NULL PRIMARY KEY
   ,reg_id            VARCHAR2(10)  NOT NULL
   ,reg_dep           VARCHAR2(3)   NOT NULL
   ,reg_manager1      VARCHAR2(10)  NOT NULL
   ,reg_manager2      VARCHAR2(10)  NOT NULL
   ,reg_manager3      VARCHAR2(10)  NULL
   ,reg_manager4      VARCHAR2(10)  NULL
   ,reg_manager5      VARCHAR2(10)  NULL
   ,reg_title         VARCHAR2(30)  NOT NULL
   ,reg_cont          CLOB          NOT NULL
   ,reg_state         VARCHAR2(30)  NULL
   ,reg_reason        VARCHAR2(100) NULL
   ,reg_register      DATE  NULL
   ,reg_update1       DATE  NULL
   ,reg_update2       DATE  NULL
   ,reg_update3       DATE  NULL
   ,reg_update4       DATE  NULL
   ,reg_update5       DATE  NULL
   ,reg_type          VARCHAR2(60) NOT NULL
   ,reg_labelNum      NUMBER       DEFAULT  0
   ,coment            VARCHAR2(300) NOT NULL
);
COMMENT ON COLUMN report.report_no    IS '전자결제 번호';
COMMENT ON COLUMN report.reg_id       IS '등록자 아이디';
COMMENT ON COLUMN report.reg_dep      IS '결제 등록 부서';
COMMENT ON COLUMN report.reg_manager1 IS '상급자 결제1';
COMMENT ON COLUMN report.reg_manager2 IS '상급자 결제2';
COMMENT ON COLUMN report.reg_manager3 IS '상급자 결제3';
COMMENT ON COLUMN report.reg_manager4 IS '상급자 결제4';
COMMENT ON COLUMN report.reg_manager5 IS '상급자 결제5';
COMMENT ON COLUMN report.reg_title    IS '결제 제목';
COMMENT ON COLUMN report.reg_cont     IS '결제 내용';
COMMENT ON COLUMN report.reg_state    IS '결제 상황';
COMMENT ON COLUMN report.reg_reason   IS '결제 취소 사유';
COMMENT ON COLUMN report.reg_register IS '결제 등록일';
COMMENT ON COLUMN report.reg_update1  IS '결제 결제일1';
COMMENT ON COLUMN report.reg_update2  IS '결제 결제일2';
COMMENT ON COLUMN report.reg_update3  IS '결제 결제일3';
COMMENT ON COLUMN report.reg_update4  IS '결제 결제일4';
COMMENT ON COLUMN report.reg_update5  IS '결제 결제일5';
COMMENT ON COLUMN report.reg_type     IS '결제양식';
COMMENT ON COLUMN report.reg_labelNum IS '라벨번호';
--1.12.전자결제 권한신청
CREATE TABLE connectReport(
    report_no         VARCHAR2( 10) NOT NULL 
   ,reg_id            VARCHAR2( 10) NOT NULL
   ,reg_result        VARCHAR2(  2) NULL
   ,reg_reason        VARCHAR2(100) NOT NULL
   ,reg_cancel        VARCHAR2(100) NULL
);
COMMENT ON COLUMN connectReport.report_no  IS '전자결제 번호';
COMMENT ON COLUMN connectReport.reg_id     IS '신청자 아이디';
COMMENT ON COLUMN connectReport.reg_result IS '접근 권한 결과';
COMMENT ON COLUMN connectReport.reg_reason IS '접근 사유';
COMMENT ON COLUMN connectReport.reg_cancel IS '반려 이유';
--1.13.명함(BUSINESSCARD)
CREATE TABLE BUSINESSCARD(
     BUSINESS_NAME         VARCHAR2(15 BYTE)   NOT NULL
    ,BUSINESS_CO           VARCHAR2(20 BYTE)   NOT NULL
    ,BUSINESS_TEL          VARCHAR2(20 BYTE)   NOT NULL
    ,BUSINESS_RANK         VARCHAR2(30 BYTE)   NOT NULL
    ,BUSINESS_REGID        VARCHAR2(10 BYTE)   NOT NULL
    ,BUSINESS_SEQ          VARCHAR2(20 BYTE)   NOT NULL PRIMARY KEY
);
COMMENT ON COLUMN BUSINESSCARD.BUSINESS_SEQ   IS '명한번호';
COMMENT ON COLUMN BUSINESSCARD.BUSINESS_CO    IS '명함회사';
COMMENT ON COLUMN BUSINESSCARD.BUSINESS_TEL   IS '명함전화번호';
COMMENT ON COLUMN BUSINESSCARD.BUSINESS_RANK  IS '명함직위';
COMMENT ON COLUMN BUSINESSCARD.BUSINESS_REGID IS '명함등록자';
COMMENT ON COLUMN BUSINESSCARD.BUSINESS_NAME  IS '명함이름';
--1.14.메모(POST)
CREATE TABLE POST(
     POSTNO                NUMBER  NOT NULL   PRIMARY KEY
    ,POSTID                VARCHAR2(10 BYTE)  NULL
    ,POSTCONT              VARCHAR2(90 BYTE)  NULL
    ,POST_DATE             DATE    NULL
    ,POST_DELTEDATE        DATE    NULL 
);
COMMENT ON COLUMN post.POSTNO         IS '메모번호';
COMMENT ON COLUMN post.POSTID         IS '메모자ID';
COMMENT ON COLUMN post.POSTCONT       IS '메모내용';
COMMENT ON COLUMN post.POST_DATE      IS '등록일';
COMMENT ON COLUMN post.POST_DELTEDATE IS '삭제일';
--1.15.메시지(MESSAGE)
CREATE TABLE MESSAGE(
     MSG_NO                NUMBER  NOT NULL PRIMARY KEY
    ,MSG_SENDER            VARCHAR2(10 BYTE)  NULL
    ,MSG_RECEIVER          VARCHAR2(10 BYTE)  NULL
    ,MSG_CONT              VARCHAR2(35 CHAR)  NULL
    ,MSG_REGDATE           DATE    DEFAULT  SYSDATE
    ,MSG_LEADDATE          DATE    NULL
    ,MSG_DELPREDATE        DATE    NULL
    ,MSG_STATE             VARCHAR2( 1 CHAR)  DEFAULT  'N' NULL 
);
COMMENT ON COLUMN MESSAGE.MSG_NO       IS '메시번호';
COMMENT ON COLUMN MESSAGE.MSG_SENDER   IS '보낸자';
COMMENT ON COLUMN MESSAGE.MSG_RECEIVER IS '받은자';
COMMENT ON COLUMN MESSAGE.MSG_CONT     IS '내용';
COMMENT ON COLUMN MESSAGE.MSG_REGDATE  IS '보낸일';
COMMENT ON COLUMN MESSAGE.MSG_LEADDATE IS '읽은일';
COMMENT ON COLUMN MESSAGE.MSG_DELPREDATE IS '삭제일';
COMMENT ON COLUMN MESSAGE.MSG_STATE    IS '보관상태';
--1.16.설문조사(SURVEY)
CREATE TABLE SURVEY(
     SURVEY_NUM            NUMBER NOT NULL    PRIMARY KEY
    ,SURVEY_TITLE          VARCHAR2( 30 BYTE) NULL
    ,SURVEY_CONTENT        VARCHAR2(300 BYTE) NULL
    ,SURVEY_WRITER         VARCHAR2( 10 BYTE) NULL
    ,SURVEY_START          DATE   NULL
    ,SURVEY_END            DATE   NULL
    ,SURVEY_STATE          VARCHAR2(  6 BYTE) NULL
    ,SURVEY_COUNT          NUMBER NULL 
);
COMMENT ON COLUMN SURVEY.SURVEY_NUM     IS '설문 번호';
COMMENT ON COLUMN SURVEY.SURVEY_TITLE   IS '설문 제목';
COMMENT ON COLUMN SURVEY.SURVEY_CONTENT IS '설문 설명';
COMMENT ON COLUMN SURVEY.SURVEY_WRITER  IS '설문 작성자';
COMMENT ON COLUMN SURVEY.SURVEY_START   IS '설문 작성일';
COMMENT ON COLUMN SURVEY.SURVEY_END   IS '설문 마감일';
COMMENT ON COLUMN SURVEY.SURVEY_STATE IS '설문 상태';
COMMENT ON COLUMN SURVEY.SURVEY_COUNT IS '응답수';
--1.17.설문조사질문(SURVEYCHK)
CREATE TABLE SURVEYCHK(
     SURVEYCHK_GNUM        NUMBER  NOT NULL
    ,SURVEYCHK_QNUM        NUMBER  DEFAULT 1
    ,SURVEYCHK_QCONTENT    VARCHAR2(90 BYTE)  NULL
    ,SURVEYCHK_ANUM        NUMBER  NULL
    ,SURVEYCHK_ACONTENT    VARCHAR2(90 BYTE)  NULL
    ,SURVEYCHK_COUNT       NUMBER  NULL
);
COMMENT ON COLUMN SURVEYCHK.SURVEYCHK_GNUM     IS '설문조사 그룹넘버';
COMMENT ON COLUMN SURVEYCHK.SURVEYCHK_QNUM     IS '질문지 번호';
COMMENT ON COLUMN SURVEYCHK.SURVEYCHK_QCONTENT IS '질문지 내용';
COMMENT ON COLUMN SURVEYCHK.SURVEYCHK_ANUM     IS '선택지 번호';
COMMENT ON COLUMN SURVEYCHK.SURVEYCHK_ACONTENT IS '선택지 내용';
COMMENT ON COLUMN SURVEYCHK.SURVEYCHK_COUNT    IS '응답수';
--1.18.설문조사응답회원(SURVEYINFO)
CREATE TABLE SURVEYINFO
(
     SURVEYINFO_GNUM       NUMBER  NOT NULL
    ,SURVEYINFO_QNUM       NUMBER  DEFAULT 1
    ,SURVEYINFO_MEMBER     VARCHAR2(10 BYTE) NOT NULL
    ,SURVEYINFO_CHK        NUMBER  NULL
);
COMMENT ON COLUMN SURVEYINFO.SURVEYINFO_GNUM   IS '설문조사 그룹넘버';
COMMENT ON COLUMN SURVEYINFO.SURVEYINFO_QNUM   IS '질문지 번호';
COMMENT ON COLUMN SURVEYINFO.SURVEYINFO_MEMBER IS '설문 응답사원';
COMMENT ON COLUMN SURVEYINFO.SURVEYINFO_CHK    IS '설문 응답선택지';
--1.16.사용자정의메인(CUSTOMMAINLIST)
CREATE TABLE CUSTOMMAINLIST(
     CUSTOMID   VARCHAR2(20 BYTE)NOT NULL PRIMARY KEY
    ,CUSTOMNAME VARCHAR2(15 BYTE)NOT NULL
    ,CUSTOMCODE CLOB             NOT NULL 
);
COMMENT ON COLUMN CUSTOMMAINLIST.CUSTOMID   IS '커스텀 아이디 : 영문(20자)';
COMMENT ON COLUMN CUSTOMMAINLIST.CUSTOMNAME IS '커스텀 이름 : 한글(5자)';
COMMENT ON COLUMN CUSTOMMAINLIST.CUSTOMCODE IS '커스텀 htmlCode : ';
--1.17.사용자정의메인저장(CUSTOMMAINSAVE)
CREATE TABLE CUSTOMMAINSAVE(
     REG_ID                VARCHAR2(10 BYTE) NOT NULL
    ,CUSTOMLOC             VARCHAR2( 5 BYTE) NOT NULL
  ,CUSTOMRANK            VARCHAR2( 2 BYTE) NOT NULL
    ,CUSTOMID              VARCHAR2(20 BYTE) NOT NULL
);
COMMENT ON COLUMN CUSTOMMAINSAVE.REG_ID     IS '작성자id : memberJoin 의 enum';
COMMENT ON COLUMN CUSTOMMAINSAVE.CUSTOMLOC  IS '커스텀 위치 : 코드 none';
COMMENT ON COLUMN CUSTOMMAINSAVE.CUSTOMRANK IS '커스텀 순위 : 코드 00,21,11,et';
COMMENT ON COLUMN CUSTOMMAINSAVE.CUSTOMID   IS '커스텀아이디 : custionMainList의 custionId';
--1.18.사용자정의메뉴(MENU)
CREATE TABLE MENU(
     MENUID                NUMBER(10)    NOT NULL  PRIMARY KEY
    ,NAME                  VARCHAR2(  20 BYTE)NULL
    ,PATH                  VARCHAR2(3000 BYTE)NULL 
);
COMMENT ON COLUMN MENU.MENUID IS '메뉴아이디 : ';
COMMENT ON COLUMN MENU.NAME IS '메뉴이름 : ';
COMMENT ON COLUMN MENU.PATH IS '메뉴경로 : ';

--1.19.사용자정의메뉴저장(CUSTOMMENU)
CREATE TABLE CUSTOMMENU(
     MEMBER_ENUM           VARCHAR2(10 BYTE) NOT NULL
    ,MENUID                NUMBER(10)  NOT NULL
    ,SNUM                  NUMBER      NOT NULL 
);
COMMENT ON COLUMN CUSTOMMENU.MEMBER_ENUM IS '작성자 ID : memberJoin 의 enum';
COMMENT ON COLUMN CUSTOMMENU.MENUID      IS '매뉴 ID : MENU 의MENUID';
COMMENT ON COLUMN CUSTOMMENU.SNUM        IS '매뉴 순서 : ';
--1.20.건의사항(SUGGEST)
CREATE TABLE SUGGEST(
     SUG_NUM               NUMBER(20)   NOT NULL PRIMARY KEY
    ,SUG_GNUM              NUMBER(20)   NOT NULL
    ,SUG_ONUM              NUMBER(20)   NOT NULL
    ,SUG_NESTED            NUMBER(20)   NOT NULL
    ,SUG_ID                VARCHAR2(10 BYTE)   NOT NULL
    ,SUG_NAME              VARCHAR2(15 BYTE)   NOT NULL
    ,SUG_TITLE             VARCHAR2(90 BYTE)   NOT NULL
    ,SUG_CONT              VARCHAR2(3000 CHAR) NOT NULL
    ,SUG_REGDATE           DATE          DEFAULT  SYSDATE NULL
    ,SUG_RCOUNT            NUMBER(10)    DEFAULT  0   NULL
    ,SUG_DELETE            VARCHAR2(2)   DEFAULT  '0' NULL
);
COMMENT ON COLUMN SUGGEST.SUG_NUM IS '건의사항 게시글의 SEQ : ';
COMMENT ON COLUMN SUGGEST.SUG_GNUM IS '건의게시글 답글처리위한 묶음번호 : ';
COMMENT ON COLUMN SUGGEST.SUG_ONUM IS '건의게시글 답글처리시 정렬번호 : ';
COMMENT ON COLUMN SUGGEST.SUG_NESTED IS '건의게시글 답글처리시들여쓰기 : ';
COMMENT ON COLUMN SUGGEST.SUG_ID IS '글 작성자 seq : memberJoin 의 enum';
COMMENT ON COLUMN SUGGEST.SUG_NAME IS '글 작성자 이름 : memberJoin 의 name';
COMMENT ON COLUMN SUGGEST.SUG_TITLE IS '글 제목 : 한글(30자)';
COMMENT ON COLUMN SUGGEST.SUG_CONT IS '글 내용 : 한글(1000자)';
COMMENT ON COLUMN SUGGEST.SUG_REGDATE IS '등록일 : ';
COMMENT ON COLUMN SUGGEST.SUG_RCOUNT IS '조회수 : ';
COMMENT ON COLUMN SUGGEST.SUG_DELETE IS '삭제 여부 : 코드 0,1';
--1.21.건의사항댓글(SUGANS)
CREATE TABLE SUGANS(
     ANS_NO                NUMBER(20)   NOT NULL PRIMARY KEY
    ,ANS_SUGNUM            NUMBER(20)   NOT NULL
    ,ANS_ID                VARCHAR2( 10)NOT NULL
    ,ANS_NAME              VARCHAR2( 15)NOT NULL
    ,ANS_CONT              VARCHAR2(300)NOT NULL
    ,ANS_REGDATE           DATE         DEFAULT  SYSDATE NULL
    ,ANS_DEL               VARCHAR2(2)  DEFAULT  '0' NULL 
);
COMMENT ON COLUMN SUGANS.ANS_NO IS '댓글 SEQ : ';
COMMENT ON COLUMN SUGANS.ANS_SUGNUM IS '댓글의 원글 번호 : suggest테이블의sug_num';
COMMENT ON COLUMN SUGANS.ANS_ID IS '댓글 작성자 ID : memberJoin 의 enum';
COMMENT ON COLUMN SUGANS.ANS_NAME IS '댓글 작성자 NAME : memberJoin 의 name';
COMMENT ON COLUMN SUGANS.ANS_CONT IS '댓글 내용 : 한글100자';
COMMENT ON COLUMN SUGANS.ANS_REGDATE IS '댓글 작성일  : ';
COMMENT ON COLUMN SUGANS.ANS_DEL IS '댓글 삭제여부  : 코드 0,1,2,10';
--1.22.공지사항(NOTICE)
CREATE TABLE NOTICE(
     NOTICE_NUM            NUMBER    NOT NULL  PRIMARY KEY
    ,NOTICE_TITLE          VARCHAR2( 200 BYTE) NOT NULL
    ,NOTICE_CONTENT        VARCHAR2(2000 BYTE) NOT NULL
    ,NOTICE_WRITER         VARCHAR2(  10 BYTE) NULL
    ,NOTICE_DATE           DATE    NULL
    ,NOTICE_READCNT        NUMBER  NULL
    ,NOTICE_STATE          VARCHAR2(   1 BYTE) DEFAULT  'N'  NOT NULL
    ,NOTICE_TYPE           VARCHAR2(   9 BYTE) NULL 
);
COMMENT ON COLUMN NOTICE.NOTICE_NUM     IS '게시글 번호';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE   IS '게시글 제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '게시글 내용';
COMMENT ON COLUMN NOTICE.NOTICE_WRITER  IS '작성자';
COMMENT ON COLUMN NOTICE.NOTICE_DATE    IS '작성일';
COMMENT ON COLUMN NOTICE.NOTICE_READCNT IS '조회수';
COMMENT ON COLUMN NOTICE.NOTICE_STATE   IS '게시글 삭제여부';
COMMENT ON COLUMN NOTICE.NOTICE_TYPE    IS '게시글 종류';
--1.23.비디오시청이력(CONNECTVIDEO)
CREATE TABLE CONNECTVIDEO(
     MEMBER_ENUM           VARCHAR2(10 BYTE)  NOT NULL
    ,BNUM                  NUMBER             NOT NULL
    ,COMPLETE              VARCHAR2(10 BYTE)  NULL
    ,watchinfo             NUMBER             NULL
);
COMMENT ON COLUMN CONNECTVIDEO.MEMBER_ENUM IS '사원번호 : memberJoin 의 enum';
COMMENT ON COLUMN CONNECTVIDEO.BNUM IS '게시글 번호 : VIDEOBOARD 의 BNUM';
COMMENT ON COLUMN CONNECTVIDEO.COMPLETE IS '완료 유무 : ';
--1.24.비디오게시판(VIDEOBOARD)
CREATE TABLE VIDEOBOARD(
    BNUM                   NUMBER  NOT NULL  PRIMARY KEY
    ,TITLE                 VARCHAR2(30 BYTE) NOT NULL
    ,CONTENT               VARCHAR2(90 BYTE) NULL
    ,REG_DATE              DATE    DEFAULT   SYSDATE NOT NULL
    ,CATEGORY              VARCHAR2(30 BYTE)  NULL
    ,START_DATE            DATE    NULL
    ,END_DATE              DATE    NULL
    ,SECRET                NUMBER  NULL
);
COMMENT ON COLUMN VIDEOBOARD.BNUM       IS '게시글 번호 : ';
COMMENT ON COLUMN VIDEOBOARD.TITLE      IS '제목 : 한글(10자)';
COMMENT ON COLUMN VIDEOBOARD.CONTENT    IS '내용 : 한글(30자)';
COMMENT ON COLUMN VIDEOBOARD.REG_DATE   IS '등록이 : ';
COMMENT ON COLUMN VIDEOBOARD.CATEGORY   IS '카테고리 분류명 : 코드:영문자(30자) default';
COMMENT ON COLUMN VIDEOBOARD.START_DATE IS '시작날짜 : ';
COMMENT ON COLUMN VIDEOBOARD.END_DATE   IS '종료날짜 : ';
COMMENT ON COLUMN VIDEOBOARD.SECRET     IS '비밀글 설정 : ';
--1.25.비디오정보(VIDEOINFO)
CREATE TABLE VIDEOINFO(
     ORINAME               VARCHAR2(50 BYTE)  NOT NULL
    ,STOREDNAME            VARCHAR2(50 BYTE)  NOT NULL
    ,VSIZE                 NUMBER  NOT NULL
    ,BNUM                  NUMBER  NULL 
);
COMMENT ON COLUMN VIDEOINFO.BNUM IS ' : VIDEOBOARD의 BNUM';
COMMENT ON COLUMN VIDEOINFO.ORINAME IS ' : ';
COMMENT ON COLUMN VIDEOINFO.STOREDNAME IS ' : ';
COMMENT ON COLUMN VIDEOINFO.VSIZE IS ' : ';

--2.외래키추가
--2.1.회원관리 의 부서코드 와 부서코드의 부서코드
--ALTER TABLE memberJoin
--    ADD (CONSTRAINT  FK_MEMBERJOIN_DEPID  FOREIGN KEY (member_department)REFERENCES departmentCode(dep_id));
----2.2.회원관리 의 직급코드 와 직급코드의 직급코드
--ALTER TABLE memberJoin
--    ADD (CONSTRAINT  FK_MEMBERJOIN_RANKID FOREIGN KEY (member_rank)    REFERENCES rankCode(rank_id));
----2.3.클라우드 유저번호 와 회원관리 사원번호
--ALTER TABLE cloud
--  ADD (CONSTRAINT  FK_CLOUD_USER FOREIGN KEY (cloud_user) REFERENCES memberJoin(member_enum));
----2.4.그룹    팀장 과 회원관리 사원번호 leader
--ALTER TABLE memberGroup
--  ADD (CONSTRAINT  FK_MEMBERGROUP_leader   FOREIGN KEY (group_leader) REFERENCES memberJoin(member_enum));
----2.5.클라그룹 
--ALTER TABLE cloudGroup
--  ADD (CONSTRAINT  FK_CLOUDGROUP_GroupNO   FOREIGN KEY (group_no) REFERENCES memberGroup(group_no));
--ALTER TABLE cloudGroup
--  ADD (CONSTRAINT  FK_CLOUDGROUP_CloudUser FOREIGN KEY (cloud_user) REFERENCES cloud(cloud_user));
----2.6.파일정보 소유자, 그룹번호 
--ALTER TABLE fileInfo
--    ADD (CONSTRAINT  FK_FILEINFO_GROUPSEQ  FOREIGN KEY (group_seq) REFERENCES cloudGroup(group_seq));
----2.7.파일이력 파일번호, 원본파일번호 ,소유자번호 와 파일테이블
--ALTER TABLE fileHistory
--    ADD (CONSTRAINT  FK_FILEHISTORY_NO     FOREIGN KEY (file_no)   REFERENCES fileInfo(file_no));
----ALTER TABLE fileHistory
----  ADD (CONSTRAINT  FK_FILEHISTORY_ORINO  FOREIGN KEY (file_orino)REFERENCES fileInfo(file_no));
--ALTER TABLE fileHistory
--    ADD (CONSTRAINT  FK_FILEHISTORY_USER   FOREIGN KEY (file_moduser) REFERENCES memberJoin(member_enum));
----2.8.일정
--ALTER TABLE calendar
--  ADD (CONSTRAINT  FK_CALENDAR_REGID     FOREIGN KEY (calendar_regid) REFERENCES memberJoin(member_enum));
----2.9.전자결제      회원,라벨
--ALTER TABLE report
--    ADD (CONSTRAINT  FK_REPORT_REGID       FOREIGN KEY (reg_id)         REFERENCES memberJoin(member_enum));
--ALTER TABLE report
--    ADD (CONSTRAINT  FK_REPORT_labelNum    FOREIGN KEY (reg_labelNum)   REFERENCES LABEL(label_num));
----2.10.전자결제권한 회원,전자결제
--ALTER TABLE connectReport
--    ADD (CONSTRAINT  FK_CONNECTREPORT_NO_REPID FOREIGN KEY (report_no) REFERENCES report(report_no));
--ALTER TABLE connectReport
--    ADD (CONSTRAINT  FK_CONNECTREPORT_ENUM     FOREIGN KEY (reg_id)    REFERENCES memberJoin(member_enum));
----2.11.메모 - 회원
--ALTER TABLE POST
--    ADD (CONSTRAINT  FK_POST_POSTID FOREIGN KEY (POSTID) REFERENCES memberJoin(MEMBER_ENUM));
----2.12.사용자정의메인저장 - 회원 ,사용자정의메인
--ALTER TABLE CUSTOMMAINSAVE
--    ADD (CONSTRAINT  FK_CUSTOMMAINSAVE_CUSTOMID FOREIGN KEY (CUSTOMID) REFERENCES CUSTOMMAINLIST(CUSTOMID));
--ALTER TABLE CUSTOMMAINSAVE
--    ADD (CONSTRAINT  FK_CUSTOMMAINSAVE_REG_ID FOREIGN KEY (REG_ID) REFERENCES memberJoin(MEMBER_ENUM));
----2.13.사용자정의메뉴저장 - 회원 ,사용자정의메뉴
--ALTER TABLE CUSTOMMENU
--    ADD (CONSTRAINT  FK_CUSTOMMENU_MENUID FOREIGN KEY (MENUID) REFERENCES MENU(MENUID));
--ALTER TABLE CUSTOMMENU
--    ADD (CONSTRAINT  FK_CUSTOMMENU_MEMBER_ENUM FOREIGN KEY (MEMBER_ENUM) REFERENCES memberJoin(MEMBER_ENUM));
----2.14.메시지 - 회원
--ALTER TABLE MESSAGE
--    ADD (CONSTRAINT  FK_MESSAGE_MSG_SENDER   FOREIGN KEY (MSG_SENDER) REFERENCES memberJoin(MEMBER_ENUM));
----2.15.공지   - 회원
--ALTER TABLE NOTICE
--    ADD (CONSTRAINT  FK_NOTICE_NOTICE_WRITER FOREIGN KEY (NOTICE_WRITER) REFERENCES memberJoin(MEMBER_ENUM));
----2.16.건의   - 회원
--ALTER TABLE SUGGEST
--    ADD (CONSTRAINT  FK_SUGGEST_SUG_ID FOREIGN KEY (SUG_ID) REFERENCES memberJoin(MEMBER_ENUM));
----2.17.건의댓글 - 회원 ,건의번호
--ALTER TABLE SUGANS
--    ADD (CONSTRAINT  FK_SUGANS_ANS_SUGNUM FOREIGN KEY (ANS_SUGNUM) REFERENCES SUGGEST(SUG_NUM));
--ALTER TABLE SUGANS
--    ADD (CONSTRAINT  FK_SUGANS_ANS_ID FOREIGN KEY (ANS_ID) REFERENCES memberJoin(MEMBER_ENUM));
----2.18.설문조사 - 회원
--ALTER TABLE SURVEY
--    ADD (CONSTRAINT  FK_SURVEY_SURVEY_NUM FOREIGN KEY (SURVEY_WRITER) REFERENCES memberJoin(MEMBER_ENUM));
----2.19.설문조사질문 - 설문조사
--ALTER TABLE SURVEYCHK
--    ADD (CONSTRAINT  FK_SURVEYCHK_SURVEYCHK_GNUM FOREIGN KEY (SURVEYCHK_GNUM) REFERENCES SURVEY(SURVEY_NUM));
----2.20.설문조사응답 - 설문조사 ,회원
--ALTER TABLE SURVEYINFO
--    ADD (CONSTRAINT  FK_SURVEYINFO_GNUM FOREIGN KEY (SURVEYINFO_GNUM) REFERENCES SURVEY(SURVEY_NUM));
--ALTER TABLE SURVEYINFO
--    ADD (CONSTRAINT  FK_SURVEYINFO_MEMBER FOREIGN KEY (SURVEYINFO_MEMBER) REFERENCES memberJoin(MEMBER_ENUM));
----2.21.비디오정보    - 비디오게시판
--ALTER TABLE VIDEOINFO
--    ADD (CONSTRAINT  FK_VIDEOINFO_BNUM_BNUM FOREIGN KEY (BNUM) REFERENCES VIDEOBOARD(BNUM));
----2.22.비디오시청이력 - 회원,비디오게시판  
--ALTER TABLE CONNECTVIDEO
--    ADD (CONSTRAINT  FK_CONNECTVIDEO_BNUM_BNUM FOREIGN KEY (BNUM) REFERENCES VIDEOBOARD(BNUM));
--ALTER TABLE CONNECTVIDEO
--    ADD (CONSTRAINT  FK_CONNECTVIDEO_MEMBER_ENUM FOREIGN KEY (MEMBER_ENUM) REFERENCES memberJoin(MEMBER_ENUM));
----2.22.명함         - 회원
--ALTER TABLE BUSINESSCARD
--    ADD (CONSTRAINT  FK_BUSINESSCARD_REGID FOREIGN KEY (BUSINESS_REGID) REFERENCES memberJoin(MEMBER_ENUM));
--  
--3.시퀀스 생성
CREATE SEQUENCE PK_MEMBERJOIN_NO  NOCACHE;
CREATE SEQUENCE PK_MEMBERGROUP_NO NOCACHE;
CREATE SEQUENCE PK_FILEINFO_NO    NOCACHE;
CREATE SEQUENCE PK_CALENDAR_NO    NOCACHE;
CREATE SEQUENCE PK_REP_REORT_NO   NOCACHE;
CREATE SEQUENCE PK_RANKCODE_NO    NOCACHE;
CREATE SEQUENCE PK_DEPARTMENT_NO  NOCACHE;
CREATE SEQUENCE PK_LABEL_NUM      NOCACHE;
CREATE SEQUENCE PK_CLOUDGORUP_SEQ NOCACHE;
CREATE SEQUENCE PK_BUSINESS_NO    NOCACHE;
CREATE SEQUENCE PK_POST_NO        NOCACHE;
CREATE SEQUENCE PK_MESSAGE_NO     NOCACHE;
CREATE SEQUENCE PK_NOTICE_NUM     NOCACHE;
CREATE SEQUENCE PK_SUGANS_NUM     NOCACHE;
CREATE SEQUENCE PK_SUGGEST_NUM    NOCACHE;
CREATE SEQUENCE PK_SURVEY_NUM     NOCACHE;
CREATE SEQUENCE PK_VIDEOBOARD_SEQ NOCACHE;
CREATE SEQUENCE PK_VIDEOINFO_SEQ  NOCACHE;

--4.1.부서코드 기초데이터
INSERT INTO departmentCode (dep_id ,dep_name) VALUES (PK_DEPARTMENT_NO.nextval ,'전사부');
INSERT INTO departmentCode (dep_id ,dep_name) VALUES (PK_DEPARTMENT_NO.nextval ,'감사팀');
INSERT INTO departmentCode (dep_id ,dep_name) VALUES (PK_DEPARTMENT_NO.nextval ,'비서실');
INSERT INTO departmentCode (dep_id ,dep_name) VALUES (PK_DEPARTMENT_NO.nextval ,'특별회계팀');
INSERT INTO departmentCode (dep_id ,dep_name) VALUES (PK_DEPARTMENT_NO.nextval ,'전산지원팀');
INSERT INTO departmentCode (dep_id ,dep_name) VALUES (PK_DEPARTMENT_NO.nextval ,'전산팀');
INSERT INTO departmentCode (dep_id ,dep_name) VALUES (PK_DEPARTMENT_NO.nextval ,'시설팀');
--4.2.직급코드 기초데이터
INSERT INTO rankCode (rank_id ,rank_name) VALUES (PK_RANKCODE_NO.nextval ,'출입');
INSERT INTO rankCode (rank_id ,rank_name) VALUES (PK_RANKCODE_NO.nextval ,'인턴');
INSERT INTO rankCode (rank_id ,rank_name) VALUES (PK_RANKCODE_NO.nextval ,'사원');
INSERT INTO rankCode (rank_id ,rank_name) VALUES (PK_RANKCODE_NO.nextval ,'대리');
INSERT INTO rankCode (rank_id ,rank_name) VALUES (PK_RANKCODE_NO.nextval ,'과장');
INSERT INTO rankCode (rank_id ,rank_name) VALUES (PK_RANKCODE_NO.nextval ,'차장');
INSERT INTO rankCode (rank_id ,rank_name) VALUES (PK_RANKCODE_NO.nextval ,'부장');
INSERT INTO rankCode (rank_id ,rank_name) VALUES (PK_RANKCODE_NO.nextval ,'사장');
INSERT INTO rankCode (rank_id ,rank_name) VALUES (PK_RANKCODE_NO.nextval ,'회장');
INSERT INTO rankCode (rank_id ,rank_name) VALUES (PK_RANKCODE_NO.nextval ,'고문');
INSERT INTO rankCode (rank_id ,rank_name) VALUES (PK_RANKCODE_NO.nextval ,'상무이사');
INSERT INTO rankCode (rank_id ,rank_name) VALUES (PK_RANKCODE_NO.nextval ,'전무이사');
INSERT INTO rankCode (rank_id ,rank_name) VALUES (PK_RANKCODE_NO.nextval ,'사외이사');
INSERT INTO rankCode (rank_id ,rank_name) VALUES (PK_RANKCODE_NO.nextval ,'평이사');
INSERT INTO rankCode (rank_id ,rank_name) VALUES (PK_RANKCODE_NO.nextval ,'이사장');


--4.3.회원관리 기초데이터
-- 암호화됨 비번은 java u/uDbcXC0JOuv7ayQfA4Rw==  u/uDbcXC0JOuv7ayQfA4Rw==
INSERT INTO memberJoin 
(member_enum,member_department,member_rank,member_pass
,member_email,member_phone,member_adress
,member_birth,member_profile,member_regdate
,member_resignationdate,member_sign,member_name
)
VALUES (
'admin',1,1,'u/uDbcXC0JOuv7ayQfA4Rw=='
,'saseo90@naver.com','010-8622-6454','대전시 동구 자양동 동대전로 183번길 77 302호'
,'19901022','사진파일경로','20170703'
,'20170703','결재인','관리자'
);

INSERT INTO memberJoin 
(member_enum,member_department,member_rank,member_pass
,member_email,member_phone,member_adress
,member_birth,member_profile,member_regdate
,member_resignationdate,member_sign,member_name
)
VALUES (
'admin1',1,1,'java'
,'do_to_be@naver.com','010-1004-1004','김밥 천국구 떡볶이는 서비스 1004호'
,'19901022','사진파일경로','20170703'
,'20170703','결재인','관리자1'
);
INSERT INTO memberJoin 
(member_enum,member_department,member_rank,member_pass
,member_email,member_phone,member_adress
,member_birth,member_profile,member_regdate
,member_resignationdate,member_sign,member_name
)
VALUES (
'TM'||LPAD(PK_MEMBERJOIN_NO.nextval,6,'0'),1,1,'java'
,'karalove@naver.com','010-1004-1004',' '
,'19901022','사진파일경로','20170703'
,'20170703','결재인','테스트'
);
INSERT INTO memberJoin 
(member_enum,member_department,member_rank,member_pass
,member_email,member_phone,member_adress
,member_birth,member_profile,member_regdate
,member_resignationdate,member_sign,member_name
)
VALUES (
'TM'||LPAD(PK_MEMBERJOIN_NO.nextval,6,'0'),1,1,'java'
,'karalove@naver.com','010-1004-1004',' '
,'19901022','사진파일경로','20170703'
,'20170703','결재인','테스트'
);INSERT INTO memberJoin 
(member_enum,member_department,member_rank,member_pass
,member_email,member_phone,member_adress
,member_birth,member_profile,member_regdate
,member_resignationdate,member_sign,member_name
)
VALUES (
'TM'||LPAD(PK_MEMBERJOIN_NO.nextval,6,'0'),1,1,'java'
,'karalove@naver.com','010-1004-1004',' '
,'19901022','사진파일경로','20170703'
,'20170703','결재인','테스트'
);
--4.5.클라우드 기초데이터
INSERT INTO cloud (
cloud_user ,cloud_grade ,cloud_maxsize  ,cloud_amount 
) VALUES (
'TM000001' ,1,5,0
);
INSERT INTO cloud (
cloud_user ,cloud_grade ,cloud_maxsize  ,cloud_amount 
) VALUES (
'TM000002' ,1,5,0
);
INSERT INTO cloud (
cloud_user ,cloud_grade ,cloud_maxsize  ,cloud_amount 
) VALUES (
'TM000003' ,1,5,0
);

--4.6.그룹(맴버그룹) 기초데이터
INSERT INTO memberGroup(
group_no ,group_type ,group_typename ,group_leader 
) VALUES (
PK_MEMBERGROUP_NO.nextval ,0 ,'사원' ,'TM000001'
);
INSERT INTO memberGroup(
group_no ,group_type ,group_typename ,group_leader 
) VALUES (
PK_MEMBERGROUP_NO.nextval ,1 ,'부서' ,'TM000001'
);
INSERT INTO memberGroup(
group_no ,group_type ,group_typename ,group_leader 
) VALUES (
PK_MEMBERGROUP_NO.nextval ,2 ,'프로젝트' ,'TM000001'
);
INSERT INTO memberGroup(
group_no ,group_type ,group_typename ,group_leader 
) VALUES (
PK_MEMBERGROUP_NO.nextval ,3 ,'모임' ,'TM000001'
);

--4.7.클라우드그룹 기초데이터
INSERT INTO cloudGroup(
group_seq ,group_no ,cloud_user ,group_name ,group_regdate
) VALUES (
PK_CLOUDGORUP_SEQ.nextval ,1 ,'TM000001' ,'기본그룹' ,SYSDATE
);