// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as News_Idb from "./News_Idb.bs.js";
import * as Belt_List from "rescript/lib/es6/belt_List.js";
import * as App_Context from "../App_Context.bs.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as News_Latest from "./News_Latest.bs.js";
import * as Common_Style from "../common/Common_Style.bs.js";
import * as Common_Dialog from "../common/Common_Dialog.bs.js";
import * as Core from "@material-ui/core";
import * as JsxRuntime from "react/jsx-runtime";

function News_Message$Date(props) {
  return JsxRuntime.jsx(Core.Typography, {
              children: Caml_option.some(News_Latest.latestNews.date.toLocaleDateString()),
              variant: props.variant
            });
}

var $$Date = {
  make: News_Message$Date
};

function News_Message$Title(props) {
  var variant = props.variant;
  return Belt_List.toArray(Belt_List.mapWithIndex(News_Latest.latestNews.title, (function (index, titleLine) {
                    return JsxRuntime.jsx(Core.Typography, {
                                children: Caml_option.some(titleLine),
                                variant: variant
                              }, "news-title-line-" + String(index) + "");
                  })));
}

var Title = {
  make: News_Message$Title
};

function News_Message$Content(props) {
  var commonClasses = Common_Style.useStyles();
  return JsxRuntime.jsxs(Core.Grid, {
              children: [
                JsxRuntime.jsx(Core.Grid, {
                      children: Caml_option.some(JsxRuntime.jsx(News_Message$Date, {
                                variant: "h4"
                              })),
                      item: true
                    }),
                JsxRuntime.jsxs(Core.Grid, {
                      children: [
                        JsxRuntime.jsx(News_Message$Title, {
                              variant: "h5"
                            }),
                        JsxRuntime.jsx(Core.Grid, {
                              alignItems: "stretch",
                              children: Caml_option.some(Belt_List.toArray(Belt_List.mapWithIndex(News_Latest.latestNews.content, (function (index, param) {
                                              return JsxRuntime.jsx(Core.Grid, {
                                                          children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                                                    children: Caml_option.some(param.value),
                                                                    className: param.emphasis ? commonClasses.bold : undefined
                                                                  })),
                                                          className: param.nextLineEmpty ? commonClasses.marginBottomSm : undefined,
                                                          item: true
                                                        }, "news-line-" + String(index) + "");
                                            })))),
                              className: commonClasses.marginTopSm,
                              container: true,
                              direction: "column"
                            })
                      ],
                      className: commonClasses.marginTopSm,
                      item: true
                    })
              ],
              container: true
            });
}

var Content = {
  make: News_Message$Content
};

function News_Message(props) {
  var match = React.useState(function () {
        return true;
      });
  var setNewsRead = match[1];
  var match$1 = React.useContext(App_Context.Context.t);
  var dispatch = match$1[1];
  React.useEffect((function () {
          News_Idb.isLatestNewsRead(undefined).then(function (isLatestNewsRead) {
                Curry._1(setNewsRead, (function (param) {
                        return isLatestNewsRead;
                      }));
              });
        }), []);
  var onClose = function (param) {
    Curry._1(setNewsRead, (function (param) {
            return true;
          }));
    News_Idb.setNewsRead(new Date());
    Curry._1(dispatch, /* LatestNewsClosed */0);
  };
  return JsxRuntime.jsx(Common_Dialog.make, {
              isOpen: !match[0],
              onClose: onClose,
              children: JsxRuntime.jsx(News_Message$Content, {})
            });
}

var make = News_Message;

export {
  $$Date ,
  Title ,
  Content ,
  make ,
}
/* react Not a pure module */
