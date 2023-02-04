// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as App_Context from "../App_Context.bs.js";
import * as News_Message from "./News_Message.bs.js";
import * as JsxRuntime from "react/jsx-runtime";

function News_Page(props) {
  var match = React.useContext(App_Context.Context.t);
  var dispatch = match[1];
  var activeMenuItem = match[0].activeMenuItem;
  React.useEffect((function () {
          if (activeMenuItem !== /* News */5) {
            Curry._1(dispatch, /* StoreActiveMenuItem */{
                  _0: /* News */5
                });
          }
          
        }), [activeMenuItem]);
  return JsxRuntime.jsx(News_Message.Content.make, {});
}

var make = News_Page;

export {
  make ,
}
/* react Not a pure module */
