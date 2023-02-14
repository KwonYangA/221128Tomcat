//비동기통신객체 생성해서 담을 변수 선언
let xhrObject = null;
//비동기 통신객체 생성하는 함수 구현 - 단 리턴예약어가 없어서 반환받을 수 없음
function createRequest() {
  //자바스크립트에도 예외처리가 가능하다
  try {
    xhrObject = new XMLHttpRequest();
  } catch (trymicrosoft) {
    try {
      //MS의 IE사용자 위한 객체 생성
      xhrObject = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (error) {
      xhrObject = null;
    }
  }
  if (xhrObject == null) {
    alert("비동기 통신 객체 생성");
  }
} //end of createRequest

//span태그가 가지고 있는 텍스트 노드값을 읽어오기
//<td>100</td> 태그 이름이 없다 -> 속성을 정의 못함 -> 아이디나 클래스를 정의 못한다 -> 접근이 불가하다-> 어떡하지?
//해결방법 - 텍스트노드에 span으로 감싼다.
//el <- document.querySelector("#id")
//el <- document.querySelector(".class")
//el <- document.querySelector("태그이름")

function getText(el) {
  let text = ""; //var -> let ES6 ->ECMAScript 2015-적용안되는 브라우저이면 babel(자바스크립트 컴파일러)필요하다. 또는 번들러, parcel
  if (el != null) {
    if (el.childNodes) { //자바스크립트에서는 0이 아닌건 모두 참
      
      for (let i = 0; i < el.childNodes.length; i++) { //cost, price
        let childNode = el.childNodes[i]; //el.childNodes[0]
        //너 텍스트 노드니?
        if (childNode.nodeValue != null) {
          text = text + childNode.nodeValue;
        }
      }
    }
  }
  return text;
}
//기존 TextNode의 값을 다른 문자열로 바꾸기
/***********************************************
param1 :document.getElementById("boardSold")
param1 :document.querySelector("#boardSold")
param2 :xhrObject. 
************************************************/
function replaceText(el, value) { // el-> boardSoldEl, cashEl
  if (el != null) {//
    clearText(el); //기존에 있던 10을 지워주세요.
    //새로운 텍스트 노드 15를 생성하기
    var newNode = document.createTextNode(value); //15
    //위에서 생성한 텍스트 노드 값을 el에 붙이는 함수 호출하기
    el.appendChild(newNode); //el boardSoldEl-> <span>10</span> -> <span id=boardSole or cash></span>
  }
}
//기존 태그안에 문자열 지우는 함수 구현
function clearText(el) {
  if (el != null) {
    if (el.childNodes) {
      for (let i = 0; i < el.childNodes.length; i++) {
        let childNode = el.childNodes[i];
        el.removeChild(childNode); //해당 el삭제하기 - DOM API -> 직관적이지 않다. -> 유지보수가 어렵다
      }
    }
  }
}

function createRequest2() {
  try {
    xhrObject = new XMLHttpRequest();
  } catch (trymicrosoft) {
    try {
      //MS의 IE사용자 위한 객체 생성
      xhrObject = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (error) {
      xhrObject = null;
    }
  }
  if (xhrObject == null) {
    alert("비동기 통신 객체 생성");
  }
  return xhrObject;
} //end of createRequest
