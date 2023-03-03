import { getAuth, signInWithPopup, GoogleAuthProvider } from "firebase/auth";
//import firebase from 'firebase';

class AuthLogic {
  //생성자 정의 - 자바와는 다르게 선언 없이 초기화 가능
  //firebaseAuth , googleProvider - 전역변수
  constructor() {
    this.firebaseAuth = getAuth();
    this.googleProvider = new GoogleAuthProvider();
  }
  //로그인 시도시 구글인증인지 깃허브인증인지 문자열로 넘겨받음
  //구글인증인 경우 Google
  //깃허브 Github
  login(providerName) {
    console.log("providerName : " + providerName);
    const authProvider = this.getProvider(providerName);
    //제공자의 정보이면 팝업을 띄워서 로그인을 진행하도록 유도함
    return signInWithPopup(this.firebaseAuth, authProvider);
  }

  logout() {
    this.firebaseAuth.signOut();
  }

  onAuthChange(onUserChanged) {
    // 사용자가 바뀌었을 때 콜백함수를 받아서
    this.firebaseAuth.onAuthStateChanged((user) => {
      //사용자가 바뀔 때마다
      onUserChanged(user);
    });
  }

  getProvider(providerName) {
    switch (providerName) {
      case "Google":
        return this.googleProvider;
      case "Github":
        return this.githubProvider;
      default:
        throw new Error(`not supported provider: ${providerName}`);
    }
  }
}

/* 외부 js에서 사용하려면 반드시 추가할 것 
  왜 리덕스를 공부해야 하나? ->
*/
export default AuthLogic;
