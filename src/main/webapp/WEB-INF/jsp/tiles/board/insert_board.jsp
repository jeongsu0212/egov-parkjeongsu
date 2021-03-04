<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Font Awesome -->
<link rel="stylesheet" href="<c:out value='/' />/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Bootstrap 4 -->
<link rel="stylesheet" href="<c:out value='/' />/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<script src="<c:out value='/' />/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLte -->
<link rel="stylesheet" href="<c:out value='/' />/resources/dist/css/adminlte.min.css">	
<!-- write.html은 섬머노트 웹에디터 부분 추가(아래) -->
<link rel="stylesheet" href="<c:out value='/' />/resources/plugins/summernote/summernote.css">
<script src="/<c:out value='/' />resources/plugins/summernote/summernote.js"></script>
<!-- 메인콘텐츠영역 -->
	<div id="container">
		<!-- 메인상단위치표시영역 -->
		<div class="location_area customer">
			<div class="box_inner">
				<h2 class="tit_page">스프링 <span class="in">in</span> 자바</h2>
				<p class="location">고객센터 <span class="path">/</span> ${brdMstrVO.bbsNm}</p>
				<ul class="page_menu clear">
					<li><a href="<c:url value='/tiles/board/list_board.do?bbsId=BBSMSTR_AAAAAAAAAAAA' />" class="<c:out value='${brdMstrVO.bbsId=="BBSMSTR_AAAAAAAAAAAA"?"on":""}' />">공지사항</a></li>
					<li><a href="<c:url value='/tiles/board/list_board.do?bbsId=BBSMSTR_BBBBBBBBBBBB' />" class="<c:out value='${brdMstrVO.bbsId=="BBSMSTR_BBBBBBBBBBBB"?"on":""}' />">갤러리</a></li>
				</ul>
			</div>
		</div>	
		<!-- //메인상단위치표시영역 -->

		<!-- 메인본문영역 -->
		<div class="bodytext_area box_inner">
			<!-- 폼영역 -->
			<form method="POST" name="board_write" action="board_write.html" class="appForm">
				<fieldset>
					<legend>상담문의 입력 양식</legend>
					<p class="info_pilsoo pilsoo_item">필수입력</p>
					<ul class="app_list">
						<li class="clear">
							<label for="title_lbl" class="tit_lbl pilsoo_item">제목</label>
							<div class="app_content"><input type="text" name="title" class="w100p" id="title_lbl" placeholder="제목을 입력해주세요" required/></div>
						</li>
						<li class="clear">
							<label for="content_lbl" class="tit_lbl pilsoo_item">내용</label>
							<div class="app_content">
								<textarea name="content" id="content_lbl" class="w100p" placeholder="내용을 입력해주세요." required></textarea></div>
						</li>
						<li class="clear">
							<label for="name_lbl" class="tit_lbl pilsoo_item">작성자명</label>
							<div class="app_content"><input type="text" name="name" class="w100p" id="name_lbl" placeholder="이름을 입력해주세요" required/></div>
						</li>
						<li class="clear">
		                    <label for="file_lbl" class="tit_lbl">첨부파일</label>
		                    <div class="custom-file" style="width:96%;margin:0 2%;">
			                    <input type="file" name="file" class="custom-file-input" id="customFile">
			                    <label class="custom-file-label" for="customFile" style="color:#999;">파일첨부</label>
			                </div>

					</ul>
					<p class="btn_line">
					<button class="btn_baseColor">등록</button>
					<a href="board_list.html" class="btn_baseColor">목록</a>
					</p>	
				</fieldset>
			</form>
			<!-- //폼영역 -->
		</div>
		<!-- //메인본문영역 -->
	</div>
	<!-- //메인콘텐츠영역 -->
	
	<!-- 첨부파일 부트스트랩 디자인 JS -->
	<script src="<c:url value='/' />resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<!-- 첨부파일 선택한 내용 출력 실행 -->
	<script>
	$(document).ready(function () {
	  bsCustomFileInput.init();
	});
	</script>
	
	<script>
	$(document).ready(function(){
		$('#content_lbl').summernote({
			height:150,
			lang:"ko-KR",
			placeholder:'글 내용을 입력해 주세요',
			toolbar: [
					    ['fontname', ['fontname']],
					    ['fontsize', ['fontsize']],
					    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
					    ['color', ['forecolor','color']],
					    ['table', ['table']],
					    ['para', ['ul', 'ol', 'paragraph']],
					    ['height', ['height']],
					    ['insert',['link','video']],//'picture',
					    ['view', ['fullscreen', 'help']]
					],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
	});//textarea 중 content아이디영역을 섬머노트에디터로 변경처리 함수실행
	</script>