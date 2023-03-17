<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cmem_id = null;
	String cmem_name = null;
	//서버측에서 클라이언트(사용자) 쿠키값 좀 보내주세요
	Cookie cs[] = request.getCookies();
	int size = 0;
	//NPE발생 가능함
	if(cs!=null){
		size = cs.length;
	}
	for(int i=0; i<size; i++){
		//쿠키이름을 가져온다 - 생성자의 첫번째 파라미터 자리값
		String c_name = cs[i].getName();
		//서버측에서 클라이언트로 부터 넘겨받은 문자열 비교
		if("cmem_id".equals(c_name)){
		  cmem_id = cs[0].getValue();
		}
		//한번더 쿠키값을 꺼내 온다 - 다만 이름이 다른 - 사용자의 이름을 불러주자
		if("cmem_name".equals(c_name)){
		  cmem_name = cs[1].getValue();
		}
	}
	out.print("쿠키에서 꺼내 온 값 ==> " +cmem_id+","+cmem_name);
	if(cmem_id ==  null){
%>
<script>
		alert("로그인하세요0_0");
</script>
<% 
	}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Web Application[쿠키인증실습]</title>
    <%@ include file="../common/easyUI_common.jsp" %>
    <style type = "text/css">
    a{
    	text-decoration: none;
    }
    </style>
<!-- //////////////////////[[로그인 함수]]///////////////////////  -->
    <script type="text/javascript">
    const login = () =>{
    	/* SELECT mem_name FROM BOOK_MEMBER
        WHERE  mem_id =: id
              AND mem_pw =: pw */
              //사용자가 입력한 아이디 가져오기
              const user_id = $("#_easyui_textbox_input1").val();
           	  //사용자가 입력한 비번 가져오기
           	  const user_pw = $("#_easyui_textbox_input2").val();
           	console.log(user_id + user_pw);
			window.location.href="./login.st3?mem_id="+user_id+"&mem_pw="+user_pw;
    }
    <!-- /////////////////[[로그아웃 함수]]/////////////////////  -->
    const logout = () =>{
        const user_id = $("#_easyui_textbox_input1").val();
     	 const user_pw = $("#_easyui_textbox_input2").val();
     	console.log(user_id + user_pw);
		window.location.href="./logout.st3";
    }
    </script>
<!-- /////////////////[[로그인 화면]]///////////////////////// -->
</head>
<body>
    <h2>웹 어플리케이션 실습</h2>
    <div style="margin:20px 0;"></div>
    <div class="easyui-layout" style="width:1000px; height:550px;">
<!-- /////////////메뉴 구성[로그인화면과 트리메뉴]////////////// -->
        <div id="p" data-options="region:'west'" title="West" style="width:200px; padding:10px">
<%
	if(cmem_id == null){
		
	
%>

<!-- /////////////////[[로그인 화면]]///////////////////////// -->
		<div id="d_login" align="center">
		<input id="tb_id" type="text" style="width:170px">
		<script type="text/javascript">
		$('#tb_id').textbox({
		    iconCls:'icon-man',
		    iconAlign:'right',
		    prompt:'아이디'
		});
		</script>
		<div style="margin: 3px 0;"></div>
		<input id="pb_pw" type="text" style="width:170px">
		<script type="text/javascript">
		$('#pb_pw').textbox({
		  iconCls:'icon-lock',
		  iconAlign:'right',
		  prompt:'비밀번호'
		});
		</script>
		<div style="margin: 3px 0;"></div>
		<a id="btn_login" href ="javascript:login()">로그인</a>
		<script>
		$('#btn_login').linkbutton({
		    iconCls: 'icon-man'
		});
		</script>
		<a id="btn_member" href ="javascript:memberShip()">회원가입</a>
		<script>
		$('#btn_member').linkbutton({
		    iconCls: 'icon-man'
		});
		</script>
		</div>
<!-- ///////////////////[[로그인 화면]]///////////////////////// -->
<%
	}
	else{ //로그인을 한 상태
%>	
<!-- /////////////////[[로그아웃 화면]]///////////////////////// -->
        <div id="d_logout" align="center">
        	<span><%=cmem_name%>님 환영합니다.</span>
        	<br />
		<div style="margin: 3px 0;"></div><!--외부여백을 위, 아래 3px-->
			<a id="btn_logout" href ="javascript:logout()">로그아웃</a>
		<script>
			$('#btn_logout').linkbutton({
			    iconCls: 'icon-remove'
			});
		</script>
			<a id="btn_member" href ="javascript:memberShip()">정보수정</a>
		<script>
			$('#btn_member').linkbutton({
			    iconCls: 'icon-edit'
			});
		</script>
        </div>
<!-- /////////////////[[로그아웃 화면]]///////////////////////// -->
<%
	}
%>
<!-- 메뉴 구성[로그인화면과 트리메뉴] -->
		<div style="margin: 3px 0;"></div>
		<ul id="tre_gym" class="easyui-tree">
	    <li data-options="state:closed">
	        <span>회원관리</span>
	        <ul>
	            <li><a href="#">회원목록</a></li>      
	            <li><a href="#">회원등록</a> </li>
	            <li><a href="#">회원삭제</a> </li>     
	        </ul>
	    </li>
		</ul>
		</div>
<!-- 메뉴화면[게시판, 온라인시험, 회원관리(회원목록, 회원등록, 회원삭제), 우편번호검색기] -->
        <div data-options="region:'center'" title="Center">
        </div>
    </div>
</body>
</html>
<!-- 
부트스트랩 - 리액트 수업 -> spring과 리액트 연계 수업 -> 프로젝트 적용
반응형지원, CSS라이브러리사용
jEasyUI
이벤트처리(jquery-레거시 시스템)
자바스크립트 - 표준이 아니다. ->jquery기반이다
자바스크립트 기반의 UI솔루션 사용하기 - 큰 도움
개발자도구 활용 - 디버깅 -> 왜냐하면 html을 래핑하기때문
vue.js, reactjs

로그인 테스트흐름
1. intro 아래 index.jsp실행
2. 아이디와 비번을 입력 받는다
3. 로그인버튼 누른다-> 자바스크립트의 login()호출
4. login.do호출한다 -> 로그인 처리를 하는 서블릿 호출 - doGet(), doPost()
5. com.mvc.dao.MemberDao 클래스의 인스턴스화
6. 메소드 호출 - 로그인 처리
7. MemberDao의 login(Map[mem_id(사용자가 입력한 아이디)와 mem_pw(사용자가 입력한 비번)]) 호출
8. 리턴타입으로 Map을 받아온다(mem_id, mem_name)
9. 8번에서 돌려받은 Map에서 오라클서버에서 조회된 아이디와 이름을 세션에 담기
10. 페이지 이동()
단 forward로 응답을 처리한 경우 인증 후에 다른 서비스를 forward로 처리하는 것이 불가함 - 주의

 -->