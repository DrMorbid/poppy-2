// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import Close from "@material-ui/icons/Close";

var Close$1 = {};

function Common_Icon_Close(Props) {
  var color = Props.color;
  var fontSize = Props.fontSize;
  var className = Props.className;
  var tmp = {};
  if (color !== undefined) {
    tmp.color = color;
  }
  if (fontSize !== undefined) {
    tmp.fontSize = fontSize;
  }
  if (className !== undefined) {
    tmp.className = className;
  }
  return React.createElement(Close, tmp);
}

var make = Common_Icon_Close;

export {
  Close$1 as Close,
  make ,
}
/* react Not a pure module */
