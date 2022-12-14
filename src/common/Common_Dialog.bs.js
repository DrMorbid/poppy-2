// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Core from "@material-ui/core";
import * as Common_Icon_Close from "./icon/Common_Icon_Close.bs.js";

function Common_Dialog(Props) {
  var open = Props.isOpen;
  var onClose = Props.onClose;
  var children = Props.children;
  var fullScreen = Props.fullScreen;
  var tmp = {
    children: null,
    onClose: (function (param, param$1) {
        Curry._1(onClose, undefined);
      }),
    open: open
  };
  if (fullScreen !== undefined) {
    tmp.fullScreen = fullScreen;
  }
  return React.createElement(Core.Dialog, tmp, React.createElement(Core.DialogTitle, {
                  children: React.createElement(Core.Grid, {
                        alignItems: "center",
                        children: React.createElement(Core.Grid, {
                              children: React.createElement(Core.IconButton, {
                                    onClick: (function (param) {
                                        Curry._1(onClose, undefined);
                                      }),
                                    children: React.createElement(Common_Icon_Close.make, {})
                                  }),
                              item: true
                            }),
                        container: true,
                        justify: "flex-end"
                      })
                }), React.createElement(Core.DialogContent, {
                  children: children
                }));
}

var make = Common_Dialog;

export {
  make ,
}
/* react Not a pure module */
