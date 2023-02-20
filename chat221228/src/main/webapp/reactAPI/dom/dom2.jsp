<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id ="root"></div>
	 <script
      crossorigin
      src="https://unpkg.com/react@18/umd/react.development.js"
    ></script>
    <script
      crossorigin
      src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"
    ></script> 
    <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
	<script type = "text/javascript">
		const rootElement = document.querySelector("#root");
		const h1Element = React.createElement("h1", {children:"DOM MAKE"});
		//React는 react.development.jsdptj 참조하는 객체임
		//Client side rendering시 앞에가 주입할 대상이고 뒤에가 root위치임
		//h1Element.textContent = "DOM MAKE";
		//rootElement.appendChild(h1Element);
		//react-dom.development.js 에서 참조하는 객체임
		ReactDOM.createRoot(rootElement).render(h1Element);
	</script>
</body>
</html>

<!-- 
	바닐라 스크립트는
	순수한 javascript코드
	특정한 라이브러리나 프레임워크를 사용하지 않는 그 자체의 자바스크립트
	
	샌드박스 - playground이다
	코드샌드박스 : React등 다양한 환경에 대한 기본 설정이 다 되어있다.
 -->