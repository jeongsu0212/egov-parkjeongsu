### 스프링 작업순서
- 스프링 HelloWorld MVC 프로젝트 org.edu.controller 제작OK.
- wamp(만세아이콘)으로 마리아DB(3306포트) 설치, 사용자암호 추가 및 한글처리OK.
- 워크벤치 설치 및 ERD 작성연습, 샘플DB(edu)임포트 및 리버스 엔지니어링으로 ERD제작OK.
- 샘플반응형 웹페이지(mobile,tablet,pc용) 및 J쿼리 페이지 작성OK.
- 스프링 프로젝트 관리자단 AdminLTE(부트스트랩)기반으로 제작OK.
- 스프링 테스트 pom.xml(외부라이브러리가져다가사용하는 방식) 디펜던시 의존성 추가OK.
- 메이븐기반 전자정부표준프레임워크 egov3.9버전 -> 3.10으로 업드레이드OK.
- junit(JavaUnit) 테스트 설정 후 기본 unit유닛(단위)테스트OK.
- jdbc(JavaDataBaseConnection)사용 pom.xml 의존성 추가OK.
- Mysql사용 pom.xml 의존성 추가OK.
- 마이바티스 사용(CRUD쿼리를관리하는툴) pom.xml 의존성 추가OK.
- junit으로 DB접근 후 관리자단 회원관리 CRUD unit테스트 마무리OK.
- @Component애노테이션사용으로 MemberVO 인젝션사용 가능OK.
- DB 디버그용 드라이버 사용 pom.xml 의존성 추가 후, log4jdbc.log4j2.properties 추가 OK.
- 실제 회원관리 화면 CRUD 적용 중 jsp중 member_list(select+검색)처리 후 페이징처리 OK.
- member_write, member_update, member_delete 만들기 작업OK.
- 스프링 AOP(관점지향프로그래밍-OOP의 확장기능)기능으로 개발용 디버그출력환경 만들기 시작.
- pom.xml에 AOP모듈 추가 필수
- root-context.xml에서 aop태그 추가
- 관리자단 실제 게시판 화면 CRUD 적용OK.
- 트랜잭션 @Tansactional추가: root-context.xml에서 dataSource에 트랜잭션 설정추가필수OK.
- 파일업로드 라이브러리 사용 pom.xml 의존성 추가OK.
- 관리자단 게시판 업로드 화면 구현OK.
- 댓글에서 Json데이터 사용 pom.xml 의존성 추가.(댓글 Rest-Api에서필요)
- 보통 jackson, Gson 외부라이브러리를 사용할때는 pom.xml에 모듈을 추가해야 하지만,
- Rest컨트롤러 클래스안에 ResponseEntity<String>를 사용해서 Json데이터로 반환합니다.
- 그래서, pom.xml 모듈추가 없가없이 작업 진행 합니다.X(잘못된 정보)
- jackson-databind 모듈추가했음.
- 실제 댓글 화면CRUD적용.(우리가 만들어서 제공 Rest-API백엔드단)OK.
- 사용자단 html(https://miniplugin.github.io/) 소스를 커스터마이징 후 jsp로 만들기OK.
- 인터셉터(가로채기-Interceptor)클래스를 이용해서, 예외처리를 공통 spring_error.jsp 로 바인딩 처리OK.
- 스프링시큐리티 로그인 구현 pom.xml 의존성 추가OK.
- web.xml에 스프링시큐리티 설정 추가OK.
- security-context.xml OK.
- 스프링빈클래스작업: 로그인 구현 + 관리자 회원등록시 패스워드 암호화 추가 OK.
- 사용자단 CRUD 구현(RestAPI 댓글포함)OK.
- 헤로쿠 클라우드로 배포(Hsql데이터베이스사용).
- 이후 유효성검사(객체검증,마이페이지,회원가입-탈퇴), 네이버아이디 로그인(네이버에서 제공Rest-API백엔드단) 사용 등등. pom.xml 의존성 추가.
- 게시판분리(공지사항과 겔러리게시판): 부모테이블과 필드추가 를 이용해서 다중게시판 생성처리.
- 오라클로 마이그레이션 작업OK.
- 웹프로젝트 소스를 스프링프레임워크 버전으로 5.2.5 마이그레이션(버전 업그레이드) 헤로쿠배포OK.
- 오라클 이론OK.
- eGovFrame메뉴에서 Start > New TemplateProject 심플홈 템플릿 만들어서 커스터 마이징 작업OK.
- C언어 이론(구름IDE사용) OK.
---------------------- 작업중 ------------------------------
- 안드로이드 스튜디오 4.x 이론(https://slidesplayer.org/slide/14087618/)
---------------------------------------------------------- 
- 혼자공부하는 C언어 책 목차확인 예정(IoT13번과목진행바로전).
- 파스타클라우드 제일 마직막 달에 2주기간에egov배포(클라우드용-mysql을사용)
- IoT(아두이노,노드MCU보드로 실습-C언어책3권) 2주
- 안드로이드앱(클라이언트)-통신-자바:스프링웹프로젝트(API서버) 2주
- -----------------------------------------------

#### 20210315(월) 작업예정.
- 
- XML화면과 메인액티비티JAVA와 데이터연동 및 화면재생하는 실습예정.
- egov프로젝트 사용자단에서 회원탈퇴기능 마무리.
- egov프로젝트 권한 기능 추가(GroupID로 사용자그룹,관리자그룹체크해서 AdminLTE못 들어가게 처리)
- commonUtil클래스에 관리자 권한 체크하는 메서드 추가(아래)

```
public Boolean getAuthorities() throws Exception {
	Boolean authority = Boolean.FALSE;
	if (EgovObjectUtil.isNull((LoginVO) RequestContextHolder.getRequestAttributes().getAttribute("LoginVO", RequestAttributes.SCOPE_SESSION))) {
		// 로그인세션이 없으면 즉, 로그인 하지 않으면;
		return authority;
	}
	LoginVO sessionLoginVO = (LoginVO) RequestContextHolder.getRequestAttributes().getAttribute("LoginVO", RequestAttributes.SCOPE_SESSION);
	EmployerInfoVO memberVO = memberService.viewMember(sessionLoginVO.getId());
	if("GROUP_00000000000000".equals(memberVO.getGROUP_ID())) { 
	  authority = Boolean.TRUE;
	};
	return authority;
}
```
- admin컨트롤러단 사용자권한 처리 부분 모두 변경(아래)

```
// new 사용자권한 처리
   if(!commUtil.getAuthorities()) {
        model.addAttribute("msg", "관리자로 접근할 수 없습니다. 홈페이지로 돌아가기");
        return "home.tiles";
   }
```
- 로그인시 세션 처리 commonUtil클래스의 메서드에 아래내용추가 및 jsp수정

```
EmployerInfoVO memberVO = memberService.viewMember(resultVO.getId());
if("GROUP_00000000000000".equals(memberVO.getGROUP_ID())) { 
	request.getSession().setAttribute("ROLE_ADMIN", memberVO.getGROUP_ID());
};
//마지막으로 사용자단 header.jsp에 아래내용으로 수정
<c:if test="${ROLE_ADMIN ne null}">
	<li><a href="<c:url value='/admin/home.do' />">AdminLTE</a></li>
/c:if>
```
- 아래 2가지는 egov프로젝트 또는 스프링5프로젝트 둘중에서 1가지만 작업예정
- AdminLTE 관리자단 대시보드에 최신회원등록자5명 및 최신공지사항/겔러리 5개 출력디자인 추가예정.
- 사용자단 글 수정시 본인 글만 수정가능하게 처리예정.

#### 20210312(금) 작업.
- 이클립스(큰형), STS, VS code, 안드로이드스튜디오, 인텔리J
- SQL디벨러퍼(오라클db),워크벤치(Mysql,마리아db),SQLite브라우저
- https://github.com/miniplugin/SQLite-kimilguk
- SQLite앱 메인액티비티 자바쪽 작업예정.
- xml UI단<->SQLite디비생성<->자바 메인액티비티단
- SQLite생성: DatabaseHelper.java 클래스를 생성OK.
- SQLite DB는 있으나, DBMS가 없어요(오라클,Mysql) 개발자가 직접코드로  데이터베이스파일을 만듭니다. school.db 데이터베이스명.
- SQLite데이터베이스 내용확인 툴: https://sqlitebrowser.org/dl/
- DataBaseTables.java 계약서(Contract)생성.(필드명을 1곳에서 관리)
- student 테이블 생성. 메인액티비티에서 insert 더미실행OK.
- 오후 egov프로젝트 사용자단에서 회원 가입/마이페이지 생성하기 예정.
- egov프로젝트 회원인증OK, 권한체크(사용자그룹,관리자그룹)없음추가예정.

#### 20210311(목) 작업.
- 안드로이드앱의 라이프사이클(생명주기-윤회)
- 라이프사이클: 로그인액티비티 기준 상태6가지(아래), 
- onCreate(생성),onDestroy(소멸),onStart(시작),onStop(정지),onResume(실행),onPause(일시정지)
- 로그인했을때(현재화면을 벗어날때): onPause(일시정지)->onStop(정지) 
- 로그인 후 뒤로가기했을때: onStart(시작)->onResume(실행)
- 로그아웃했을때: onCreate(생성),onStart(시작),onResume(실행)
- ----------------------------------------------------
- Oject가 null널인것 과  ""공백인것과는 틀립니다.
- null 은 객체(메모리할당)가 없습니다. 공백은 객체가 존재함. 
- view는 제일 상위의 콤포넌트 입니다. 자바의 Object와 동급
- Object <String, Interger, Double, Class ...>
- View <Layout, Button, TextView, EditText ...>
- 로그인액티비티 화면 만들어서 startActive()로 띄우기 OK.
- 액티비티간 페이지이동시 로그인 아이디/암호 값을 가져가는 연습. 
- CRUD DB에 입력/수정/삭제/조회 - 스마트폰 내부에 SQLite 데이터베이스사용 CRUD앱 연습예정.
- 리사이클러 뷰(recycler view) 콤포넌트사용.
- 신규 앱 프로젝트 깃과 연동시키기(VCS메뉴사용:Version Controller System)
- egov프로젝트 사용자단에서 회원 가입/마이페이지 생성하기 예정.

#### 20210310(수) 작업.
- 요구사항확인 과제물 리뷰OK.
- 스프링프레임워크로 납품하는것은 개인개발자의 역량이 아니고, 스프링프레임워크의 기술이 보증되기 때문에 가능합니다.
- V11.0.0 애플리케이션 설계 과목 시험준비시간(3교시)OK.
- 폰갭(PhoneGap) 유틸리티: 모바일웹페이지(스프링) 웹톰캣에배포 .war(웹 아카이브)파일->모바일앱변환시킴 구글 플레이스토어에 배포가능 .apk(안드로이드 패키징)파일로 만들어줌(하이브리드앱).
- 안드로이드 스튜디오 4.x 이론 PPT 2부터 예정.
- 안드로이드 앱의 구조:파일기준(스프링프로젝트와 비교 아래)
- pom.xml = build.gradle(app폴더내)
- servlet-context.xml = AndroidManifest.xml
- 특1, values폴더 = AndroidManifest에서 사용가능한 변수값이 지정된 파일들
- 특2, 화면의 이미지가 1개가 아니고, 2개이상일때, xml로 구성합니다.
- 콤포넌트: 객체(Object)
- 액티비티(Activity): 화면, 진입 액티비티가 존재.
- 현재 앱의 규모를 확인할때, AndroidManifest.xml을 사용.
- intent: 인텐트(편지봉투)는 액티비티에 무언가를 전달할때 사용하는 편지봉투의 역할.
- Listener(리스너): Listen은 듣다. 
- 리스너는 이벤트에 대한 대기 상태를 말합니다.
- OnClick리스너{}는 클릭 이벤트가 발생시 {자동실행}되는 구조.
- ---------------------------------------------------
- 렌더링: xml코드(자바에서생성)를 화면에 출력하는과정을 렌더링이라고 말함.

#### 20210309(화) 작업.
- 사용자단(관리자단) 페이징 처리 확인(글10개이상입력필요)OK.
- 수정할 부분(아래 코드를 list_board.jsp 상단에 넣으면 됩니다.)

```
아래 자바스크립트 추가필요
<script>
function fn_egov_select_noticeList(pageNo) {
    document.search_form.pageIndex.value = pageNo;
    document.search_form.submit();  
}
</script>
디자인 깨지는 것은 PaginationRenderer 클래스의 paganum CSS클래스명이 잘못 들어가 있어서 깨짐, 수정필요
```
- AVD에 헬로원월드앱 1개 생성해서 배포OK.
- 안드로이드앱은 액티비티(xml화면)-프로그램(java파일) 1개쌍으로 구성됨
- 앱에서 사용하는 크기(단위): 웹px(pixel)로통일(확대시깨짐),
- 앱에서는 dp(density pixel-밀도픽셀)로통일(확대시 안깨짐), sp(scale pixel-확장가능픽셀,문자전용크기)
- 3교시 과제물확인 후 -4교시 요구사항확인 과제물제출OK.
- 겔럭시AVD에서 한글않보이는 문제 처리 후 진도진행OK.
- AVD한글은 현재 롤리팝5.1이상부터 지원하기 때문에 진행OK.
- 현재 젤리빈AVD지우고, 롤리팝AVD로 다시 생성하고 테스트 합니다OK.
- -------------------------------------------------
- 교재목차(열혈자바프로그래밍, 자바웹을 다루는기술, 혼자공부하는 C언어)확인
- 모델2방식=MVC프로젝트방식
- 기본자료형(int, boolean, double), 
- Object > 참조(클래스)자료형(Integer, String, 사용자클래스-MemberVO...)
- Map<String,Object> mapData = new HashMap<String,Object>();
- Integer abc; -> (String) abc; abc.toString();
- 자바버전8이상부터 제네릭타입이 지원시작: List<Object[String|Integer|MemberVO]제네릭타입형> obj = 설렉트쿼리;
- 상수<->변수
- 애노테이션(@,Annotation): 지시자(명시자) 클래스지정
- Math클래스의 메서드를 이용해서 난수-중복아이디방지 -> UUID클래스를 이용해서 지구에서 단1개인 ID값을 생성
- 람다식(자바8이상부터지원시작): 주기능은 생략하고, 코딩해라.
- 스트림: 네트워크용어(업로드,다운로드,앱<->웹 자료전송 기능)
- java.io.~Stream클래스사용
- 1개의 웹프로그램은 1개의 쓰레드로 작동됨. 이유는 웹브라우저작동의 기본이기 때문에...
- 다중 쓰레드가 사용되는 곳은 비동기 통신(안드로이드앱 웹과 통신시)에서 주료 사용됩니다.
- for(){for(){변수1생성-스코프scope영역}; 변수1X}; ->자료형과비교시 레코드(1차원)를 -> 표(2차원)로 출력할때
- 오버로딩 public void member_insert(String a) { }
- 오버로딩 public void member_insert(String a, String b) { }
- 1차원배열: MemberVO memberVO = new MemberVO();
- 2차원배열: List<MemberVO> memberList = null;
- 11번과목 애플리케이션 설계과목 진도나감(과제물내용부터살펴봄).
- 안드로이드 스튜디오4.1.2최신버전 학습-PPT슬라이드교재사용.

#### 20210308(월) 작업.
- 콘텐츠.replaceAll("정규식패턴",""); 해석: 콘텐츠내에 정규식패턴에 필터링되는 문자열을 "" 삭제시켜라 명령
- 점심 이후 사용자단(관리자단) 페이징 처리 결과 확인예정.
- 안드로이드스튜디오 AVD 애뮬 1개추가OK.-여기까지
- 헬로앱 1개 생성. 애뮬레이터로 실행예정
- egov프로젝트 메인페이지 출력물 시큐어코딩처리_egov기존save로직에 포함되었기 때문에 시큐어코딩처리 필요X.
- 겔러리게시판 이미지 미리보기 기능추가OK.
- 공지사항게시판 출력jsp생성예정.
- 안드로이드PPT자료 학습진행 예정.

#### 20210305(금) 작업.
- 프로그래밍은 디버그-문제해결하는 부분이 주작업.
- 개발할때는 프론트가 되었던, 백엔드, C, 자바, 스프링이든 디버그환경을 신경써야 합니다.
- 수업전: egov프로젝트 에러표시 타일즈 템플릿 렌더링(화면출력)때문에 문제점이 않보입니다.
- web.xml에서 error-page 설정을 주석처리OK.
- egov 게시판 CRUD 중 CUD(타일즈적용) -> 홈컨트롤러 기존 관리자단 egov서비스이용해서 작업OK.
- 안드로이드 스튜디오4.x 설치 후 기본학습 -> 스프링프로젝트와 통신에 사용.
- 사용자단 디자인으로 메인작업(게시판내용 미리보기출력)예정.
- C언어처음, printf("hello c!");
- 자바언어처음, System.out.println("hello world!");
- 스프링처음: 스프링MVC프로젝트 최초생성 Hello월드 시간출력(한글시간깨짐)
- 안드로이드앱 처음 Blank앱(공백앱)을 생성시 Hello world 출력(안드로이드폰에 출력)
- 인텔리J(안드로드이ST,그레이들 빌드, build.gradle) = 이클립스(egov-IDE,메이븐 빌드,pom.xml)
- 앱프로젝트생성시 선택(자바.java, 코틀린.kt): 자바선택
- SDK(소프트웨어 개발 키트-외부라이브러리): 메이븐의 레포지토리폴더와 유사
- 안드로드이스튜디오 빌드->PC와USB로 연결된 스마트폰으로 실행결과확인 대신.
- 앱 결과물을 출력할 PC애뮬레이터 설치 후 애뮬을 이용해서 실행결과확인.
- 안드로이등가상기기: AVD(안드로이드 버추어 디바이스=애뮬레이터)
- 실제 폰이 없이, 앱구동이 가능.
- 신교재 2권 받으시면,목차 중에서 우리프로젝트진행상황과 매칭되는 부분 체크예정

#### 20210304(목) 작업.
- 페이징처리: list_board.jsp가 실행될때 -> ui:pagination의 type='paging' 타입이 호출 
- -> context-common.xml 의 paginationManager(빈)이 실행 -> rendererType이 paging인 pageRenderer(빈)이 실행
- jsp 의 EL(Express Language)표기법 사용해서 변수 출력.
- 이중for문은: 출력시 2차원배열(표)를 출력합니다.
- 단일for문은: 1차원배열
- 구름IDE C언어 기본학습 구구단 설명OK. -> IoT에서 사용.
- 주로 사용하는 jsp템플릿 종류:타일즈,벨로서티,타임리프,사이트메시
- egov 게시판 CRUD 디자인부터 jsp변경(타일즈적용) -> 홈컨트롤러 기존egov서비스이용해서 화면CRUD 작업예정.
- 사용자단 디자인으로 메인작업(게시판내용 미리보기출력)예정.
- 안드로이드 스튜디오4.x 설치 후 기본학습 -> 스프링프로젝트와 통신에 사용.
- 신교재 2권 받으시면,목차 중에서 우리프로젝트진행상황과 매칭되는 부분 체크예정

#### 20210303(수) 작업.
- 과제물 문서작업을 같이 진행 OK.
- PDF교재에서 2. 요구사항 확인하기 제외.
- 라이센스: BSD(버클리대학만든 소프트웨어 배포 라이센스), Mit, Apache, GNU, LGPL
- 제품 1억 으로 납품 - 1년간 무상 유지보수
- 1년 후는 유료 유지보수 : 납품가의 10% 1년유지보수계약.
- 객체지향설계해 보았습니까? A.스프링 MVC프로젝트 작업해 보았습니다.
- 프로그램을 MVC클래스 기반으로 되었는가=Controller-Service-Dao
- 이클립스,자바1.8,톰캣8.0,Mysql5.7,오라클11g,메이븐=자바,스프링개발O
- 리액트개발X: 고유의 개발환경. VS code, Create-react-app(JSX버전)
- PHP개발X: 고유의 개발환경. Vs code, WAPM(만세아이콘), Mysql
- 우리나라 그누보드, 워드프레스 페이지만들기 CMS 콘텐츠 매니지먼트 시스템 웹에이전시 PHP용 오픈소스 라이센스
- 게시판관리, 페이지관리, 메뉴관리 = Contents Management System.
- jsp용 CMS 오픈 라이센스 없습니다.
- jsp용 CMS 상용 라이센스는 많이 있습니다.
- 자바,C프로그램은 보통 1장짜리 프로그램소스
- MVC스프링프로젝트 보통 1권짜리 프로그램소스

#### 20210302(화) 작업
- 컨테이너/클래스/객체/앱 라이프사이클(생명주기):생성>준비>실행<대기>소멸
- 발주사 제안요청서(RFP)만들어서 나라장터에 올림 -> RFP를보고 개발사 제안서작성.
- DB인터페이스 구현 과제물제출 OK.(4교시)
- 사용자단 타일즈 디자인으로 게시판작업_디자인까지만 갖다놓고 여기까지 OK.
- V.10.0.0진도 시작(PDF교재보면서)
- 프론트엔드 프레임워크:리액트React/뷰Vue 프레임워크에서 CRUD 할수 있으면 OK.
- 리액트로 만들 앱을 SPA(싱글 페이지 앱 Single Page App) 라고 합니다.
- RestAPI에서 댓글 만들기와 동일: 한페이지안에서 CRUD됩니다.
- 부트스트랩(AdminLTE)디자인+제이쿼리$.ajax(비동기통신)=리액트(비동기통신)
- 백엔드 프레임워크: 스프링프레임워크/egov 프레임워크에서 CRUD 할수 있으면 OK.
- 사용자단 타일즈 디자인으로 로그인처리 OK.(로그인하면 OLD로 이동->NEW로 이동)
- 수업전 JUnit 테스트중 insert테스트에서 에러나는 부분 PageVO 객체오브젝트 new 키워드로 생성한 이후 아래 코드 추가해야 합니다.
- pageVO.setPage(1);
- pageVO.setPerPageNum(5);//하단의 페이징보여줄 개수
- pageVO.setQueryPerPageNum(10000);//쿼리에서 1페이당 보여줄 개수=화면에서 1페이당 보여줌, 현재는 테스트라서 10000개로 강제로 처리OK.
- 이전 스프링프로젝트에서 사용한 @ControllerAdvice 컨트롤러에서 발생되는 에러를 가로채는 기능을 사용하지 않고 아래내용을 사용합니다OK.

```
<!-- 
   행자부 시큐어코딩 가이드에 따라서 에러코드를 노출하면 않되기 때문에 일반안내문자로 표기합니다.
   이전 스프링프로젝트에서 사용한 @ControllerAdvice 컨트롤러에서 발생되는 에러를 가로채는 기능을 사용X
   사전처리: 이전에 주석처리한 web.xml 의 에러페이지 주석해제 후 error.jsp에 아래내용 추가
   사전확인: 이전에 주석처리한 egov-com-servlet.xml 내용만 확인
   기술참조:https://mystarlight.tistory.com/123
-->
<!-- 주의: 개발할때는 아래내용이 필요하지만, 배포할때는 주석 처리해서 보이지 않게 합니다. -->
<br>에러code : ${requestScope['javax.servlet.error.status_code']}
<br>exception type : ${requestScope['javax.servlet.error.exception_type']}
<br>message : ${requestScope['javax.servlet.error.message']}
<br>exception : ${requestScope['javax.servlet.error.exception']}
<br>request uri : <a href="${requestScope['javax.servlet.error.request_uri']}">${requestScope['javax.servlet.error.request_uri']}</a>
<br>servlet name : ${requestScope['javax.servlet.error.servlet_name']}
<c:set var="exception" value="${requestScope['javax.servlet.error.exception']}"/>
<br>에러추적trace : 
 <ul>
  <c:forEach items="${exception.getStackTrace()}" var="stack">
<li>${stack.toString()}</li>
</c:forEach>
 </ul>
```

#### 20210226(금) 작업
- 첨부파일 저장 한 이후 수정할때 에러가 발생 처리OK.
- 수정한 이후 리스트로 이동 -> 뷰 페이지로 이동하게 변경OK.
- 기존 egov는 첨부파일을 여러번 입력가능때문에, 우리 삭제로직을 약간변경OK.
- 글작성에 관련된 insert_board.jsp생성+컨트롤러 추가OK.
- 관리자단 마무리 -> 사용자단 디자인으로 메인+게시판CRUD
- 사용자단 resources/home폴더 생성해서 이 디자인OK. 
- 기존 egov디자인 메인 main폴더 -> 우리home디자인의 메인 home폴더 변경해서 적용
- edu.human.com.home.web 패키지에 컨트롤러.
- redirect(새로고침해도 글이 재등록이 않됨-이전데이터를 날리고 이동.) VS forward(새로고침하면 글이 중복등록이 됨-이전페이지데이터를 가지고이동) = 폭탄게시판이 만들어 집니다.
- null VS ''공백 의 차이점: null은 변수명이 존재하지 않는상태(메모리할당X), ''공백은 변수명은 존재하지만(메모리할당O), 값이 비어있는변수.
- index.jsp 파일을 수정해서 home폴더가 주 디자인으로 되게 변경OK.
- 로그아웃은 페이지가 없이 처리 되기 때문에 home컨트롤러만 매핑을 추가해서 처리OK.
- tiles,velocity,thymeleaf 3가지 jsp템플릿 종류중 타일즈 템플릿을 사용해서 home디자인을 사용할 예정. 
- IT강의저장소 V9.0.0 하단 자료를 참조.
- tiles의 타일 목욕탕의 타일붙여서 사용하는 내용과 의미가 비슷.
- /tiles/home.do URL호출 -> home.tiles 파일File호출 타일즈설정이 가로챕니다.(layout.jsp파일에서 가로챔)
- /WEB-INF/jsp/tiles/{1}.jsp 바인딩 -> content이름에 담겨서...
- /WEB-INF/jsp/tiles/layouts/layout.jsp 이파일의 content이름에 나오게됨
- error_user.jsp 페이지만들어서 1페이지안에 에러메시지 보이게 처리예정.

#### 20210225(목) 작업
- egov(Mysql) 마무리.
- 기존: 게시판 삭제시 기존 USE_AT='N' 처리해서 실제 삭제 X(이로직,파일삭제X)
- 변경: 게시판 삭제시 레코드삭제처리로. 첨부파일같이 삭제(이로직,파일삭제O)
- boardService엣 위 게시물 삭제로직도 추가.(기존FileVO그대로사용)
- 구름IDE C언어 구구단 설명예정.

#### 20210223(화) 작업
- 인터페이스 구현 수업 진도시작.
- https://github.com/miniplugin/human/tree/v9.0.0
- 수업전: 어제삭제 하는 부분에서 첨부파일 삭제까지 처리확인.
- (egovError.jsp 에 제대로된 error메세지표시)
- WEB-INF/jsp/cmm/error/egovError.jsp 확인예정.
- egov 관리자단 게시판부분 CRUD 작업 마무리예정.
- 학원PC: 설치할 SW
- egov.zip : 
- https://drive.google.com/file/d/1GnIzkvZNgVj-o4EbHzoy5WSDCEWk3GAx/view?usp=sharing
- egov3.10..zip:
- https://drive.google.com/file/d/1YqSF2rKbR1M1hbn_fn_Jpg6n8_7abf96/view?usp=sharing
- mysql : 
- https://drive.google.com/file/d/1r2tUfV_eeYS2XhzXKabCZeEgeLP-LYL0/view?usp=sharing
- ---------------
- 사용자단 메인페이지 UI 변경예정(타일즈템플릿-벨로서티템플릿 jsp UI템플릿을 사용) tiles템플릿을 사용예정.
- 위 JSP UI템플릿은 include기능을 확장한 라이브러리.
- 쉬어가는 시간에 포인터이후 진도확인 및 C언어 은행입출금프로그램 실습예정.

#### 20210222(월) 작업
- 서버프로그램 과제물 제출 4교시에 있습니다.
- egov 관리자단 게시판부분 CRUD 작업 마무리예정.
- 바인딩=매칭=매핑
- Flag=깃발=상태를표시할때 사용.
- 기존 전자정부프로젝트에서의 삭제. => 진짜로 삭제가 아니고, 삭제필드(플래그필드USE_AT)에 삭제표시Y->N를 합니다.
- egov프로젝트에서의 삭제. => 진짜로 삭제할 예정 입니다.
- -------------------------------------------------------------
- 사용자단 메인페이지 UI 변경예정(타일즈템플릿-벨로서티템플릿 jsp UI템플릿을 사용) tiles템플릿을 사용예정.
- 위 JSP UI템플릿은 include기능을 확장한 라이브러리.
- 쉬어가는 시간에 포인터이후 진도확인 및 C언어 은행입출금프로그램 실습예정.

#### 20210219(금) 작업
- 수업전 2월22일(4교시) 과제물 제출에 대해서 서식 수정본 모두 다시 확인OK.
- 매퍼쿼리 <-> PageVO변수 <-> 컨트롤러(매개변수) -> 서비스를 호출 -> DAO호출 -> 쿼리실행
- 수업전 확인OK: JSP뷰단 <- PageVO변수 <- 컨트롤러(매개변수) <- 쿼리실행
- egov프로젝트 관리자관리 검색 및 페이징 처리 추가 마무리OK.
- URL쿼리스트링에 & 기호는 최신html5코딩에서는 &amp; 이렇게 특수기호로 변환해서 사용합니다.
-1 egov게시물관리 CRUD 처리(관리자관리처럼 마이바티스이용 안하고) ibatis(기존클래스이용)적용.
-2 egov게시물관리는 컨트롤러와 JSP단만 처리합니다.(AdminLTE)
- 위 1,2을 정리하면, 관리자관리는 컨트롤러+JSP+서비스+MyBatis를 우리가 만든것 사용OK
- 게시물관리는 컨트롤러+JSP는 우리가 만들고, 서비스+iBatis는 전자정부것을 사용예정.
- 전자정부표준프레임워크기반 심플홈템플릿스프링웹프로젝트를 커스터마이징.
- 정부에서 발주해서 삼성SDS + LG CNS + SK C&C 컨소시엄으로 만들었습니다.(2011년 배포 ~ 지금까지)
- egov 프로젝트에서 세션이 발생하는 하는 부분:아래 컨트롤러
- egovframework.let.uat.uia.web패키지 안 EgovLoginController.java
- admin/board/list_board.jsp <-> EgovNoticeList.jsp
- AdminController.java       <-> EgovBBSManageController.java
- egov페이징 UI설정: context-common.xml -> ImagePaginationRenderer.java

#### 20210218(목) 작업
- 참고: egovframework.let.uat.uia.service.impl패키지명내 EgovLoginServiceImpl.java(로그인처리부분)
- 비교구문: int a = 3, float b = 3.0
- if(a==b) TRUE, if(a===b) FALSE, 이것처럼 ==값만비교, ===값과 자료형 까지비교
- 대학전산과: 1(C언어:은행입출금프로그램-기말고사),2(C++언어),3(java),4(jsp)
- 수업전: C언어 포인터실습결과 확인OK.
- egov프로젝트 관리자관리 Create,Delete 작업OK.

#### 20210217(수) 작업.
- egov프로젝트 관리자관리 RU OK.
- 차투리시간에 C언어 계속진행.

#### 20210216(화) 작업.
- 이클립스 빌드 속도 때문에 window메뉴->preference->validation검색->build탭의 체크모두해제 시킴->OK.
- web패키지(컨트롤러) 작업 + AdminLTE로 뷰jsp단 작업.(마이바티스기반-새로만들기)
- jsp단의 root(최상위)경로를 html태그의 / 에서 <c:url value='/' /> 로 변경했음.
- /admin/home.do URL액션을 주는 설정(web.xml) 확인.
- /admin/**/*.do URL액션에 로그인체크권한설정추가(egov-com-servlet.xml).
- 결과는 사용자(기존)과 관리자단을 분리했습니다.
- 관리자단 home.jsp > header, footer 로 분리.
- 코드 인스펙션(소스 분석): egov프로젝트의 진입점(webapp/index.jsp) 확인.
- egov프로젝트의 jsp(동적페이지)폴더에 html(정적페이지)를 jsp로 변환해서 배치합니다.
- 공통코드(기본코드) 테이블 이용에 대한 개념이 있어야 합니다. 오늘은 여기까지

```
-- Mysql 데이터베이스에서 CODE테이블의 코드명 가져오는 함수 만들기 (아래)
CREATE FUNCTION FN_CODE_NM (
P_CODE_ID VARCHAR(255),
P_CODE VARCHAR(255)
)
RETURNS VARCHAR(255)
BEGIN
DECLARE RETURN_VAR VARCHAR(255);
SELECT CODE_NM INTO RETURN_VAR
FROM lettccmmndetailcode 
WHERE 
CODE_ID = P_CODE_ID AND CODE = P_CODE;
RETURN RETURN_VAR;
END

CREATE FUNCTION FN_GROUP_NM(P_GROUP_ID VARCHAR(255)
) RETURNS varchar(255) CHARSET utf8
BEGIN
DECLARE RETURN_VAR VARCHAR(255);
SELECT GROUP_NM INTO RETURN_VAR
FROM lettnauthorgroupinfo
WHERE 
GROUP_ID = P_GROUP_ID;
RETURN RETURN_VAR;
END
```
- 게시판관리 부분도 작업: 아이바티스기반(기존egov것)으로 작업(컨트롤러+jsp뷰단만 작업).
- 오후에 키보드로 입력받은 1개문자를  아스키코드로 변환하는 C프로그램을 작성할 예정.

```
/********************************************************
 구현내용: 키보드로부터 한 문자를 입력 받아서 입력 
          문자에 해당하는 아스키 코드값을 출력하세요.
 작성자 : 김일국
 작성일 : 2011.06.29
 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
 출력:  문자 입력 : A
        값 : 65
 _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
*********************************************************/
#include <stdio.h>
void main()
{
    printf("키보드로 입력받은 문자를 아스키코드로 변환해서 출력하기\n");
    printf("프로그램을 종료하려면 Ctrl+C를 하세요\n");
    char cNum;
    while (1)
    {
        printf("문자 입력 : ");
        scanf("%c", &cNum);       //char형으로 문자입력
        getchar();                //입력 후 엔터 키를 공백으로 처리
        printf("-사람의 문자값:%c\n-컴퓨터의 아스키코드값:%d\n", cNum, cNum);  //int형 %d로 출력   
    }
}
```
- C언어 기초: 5장확인 후 6장 시작예정.

#### 20210215(월) 작업.
- 참조: https://ko.wikipedia.org/wiki/ASCII 여기에서 모양(사람)=십진법(컴퓨터가이해)
- 아스키코드? 사람이 이해하는 문자!=컴퓨터가 이해하는 문자가 다르기 때문에 만들어진 문자가 아스키코드
- 아스키코드예1: a(사람)=97(컴퓨터), b(사람)=98(아스키코드), C언어에서는 값비교시 아스키사용
- 아스키코드예2: 0(사람)=48(컴퓨터), 1(온도/습도)=49(아스키코드):
- row(레코드)데이터, raw(가공전 원시)데이터-빅데이터과목에서
- egov 프로젝트 생성시 심플홈템플릿 프로젝트는 관리자관리 기능이 없음.
- 관리자관리기능 추가시 edu.~ 패키지를 생성해서, 관리자관리 기능을 만드는 중.
- JUnit으로 관리자관리기능의  CRUD테스트를 시작하려고 합니다.
- VO-매퍼쿼리-DAO-Service-JUnit 구조로 Select까지 해 봤습니다.
- JUnit CRUD까지 한 이 후 OK.-------------------------------
- C언어 기초: 5장 까지OK.
- 컨트롤러 + web패키지 작업 + AdminLTE로 뷰jsp단 작업.(마이바티스기반-새로만들기)
- 게시판관리 부분도 작업: 아이바티스기반(기존egov것)으로 작업(컨트롤러+jsp뷰단만 작업).
- egov 패키지구조1: 서비스패키지(VO포함,인터페이스) 
- egov 패키지구조2: 서비스임플리먼트패키지(서비스클래스,DAO클래스)

#### 20210210(수) 작업.
- 사전지식: egov 프로젝트의 기본은 iBatis -> myBatis 변경해서 커스터마이징.
- 목표: 전자정부표준프레임워크의 커스터마이징하는 과정을 거쳐서, 내부구조를 확인하는 목적.
- 첫째, 마이바티스 사용가능하게 설정(pom.xml내용추가)
- 첫째-1: mybatis용 context명세파일 생성.(context-mapper.xml): 마이바티스에 사용되는 각종경로 명시(mapper-config.xml과 기본매퍼쿼리파일member_mysql.xml 생성).
- 첫째-2: edu.human.com패키지지정 후 클래스빈자동등록추가(egov-com-servlet.xml), VO+매퍼쿼리추가(스프링에서 클래스를 사용하려면 빈으로 등록해야 함.)
- 둘째, 스프링의 sqlSession템플릿을 DAO에서 @Inject로 직접 사용하지 않고, 전자정부 전용 EgovAbstractMapper클래스를 상속(필수)->EgovComAbstractMapper.java(Mybatis용)
- 셋째, egov 패키지명명규칙-특징:패키지는 기능별로 구분하고, 서비스와DAO가 같은 패키지에 존재함, 그래서 서비스클래스생성후 Impl폴더에 DAO클래스를 생성하게 됨.
- 넷째, JUnit테스트
- 넷째-1: pom.xml 외부라이브러리 추가OK.
- ------------------------------------
- 여기까지 작업되었습니다.------------------
- 이후는 다음주 월요일 부터
- ------------------------------------
- member쿼리CRUD 추가, DAO CRUD추가, Service CRUD추가, JUnit CRUD 테스트
- member 컨트롤러 만들기 어것을 먼저 아니면, 아래 AdminLTE 화면부터 시작하던지 선택.
- AdminLTE 템플릿을 egov프로젝트에 붙여 넣기(resources폴더에)
- AdminLTE 관리자관리기능 추가.(로그인체크에 결리게 egov-com-servlet.xml의 인터셉터에 경로추가)