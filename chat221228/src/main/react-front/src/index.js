import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import App from "./App";
import { BrowserRouter } from "react-router-dom";
import AuthLogic from "./service/authLogic";
import firebaseApp from "./service/firebase";
import "@fortawesome/fontawesome-free/js/all.js";
/* import SampleApp from "./SampleApp"; */

const authLogic = new AuthLogic(firebaseApp);
//const root = ReactDOM.createRoot(document.getElementById("root"));
const root = ReactDOM.createRoot(document.querySelector("#root"));
root.render(
  <>
    <BrowserRouter>
      <App authLogic={authLogic} />
      {/* <SampleApp /> */}
    </BrowserRouter>
  </>
);
