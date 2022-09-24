// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as News_Idb from "./News_Idb.bs.js";
import * as Belt_List from "rescript/lib/es6/belt_List.js";
import * as App_Context from "../App_Context.bs.js";
import * as News_Latest from "./News_Latest.bs.js";
import * as Common_Style from "../common/Common_Style.bs.js";
import * as Lab from "@material-ui/lab";
import * as Core from "@material-ui/core";
import * as Styles from "@material-ui/styles";

var useStyles = Styles.makeStyles({
      iconPlacement: {
        alignItems: "flex-start"
      }
    });

function News_Message(Props) {
  var match = React.useState(function () {
        return true;
      });
  var setNewsRead = match[1];
  var commonClasses = Common_Style.useStyles();
  var classes = useStyles();
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
  return React.createElement(Core.Collapse, {
              children: React.createElement(Core.Grid, {
                    alignItems: "stretch",
                    children: React.createElement(Core.Grid, {
                          children: React.createElement(Lab.Alert, {
                                children: null,
                                classes: {
                                  message: commonClasses.fullWidth,
                                  action: classes.iconPlacement
                                },
                                color: "error",
                                onClose: onClose,
                                severity: "info"
                              }, React.createElement(Lab.AlertTitle, {
                                    children: Belt_List.toArray(Belt_List.mapWithIndex(News_Latest.latestNews.title, (function (index, titleLine) {
                                                return React.createElement(Core.Typography, {
                                                            children: titleLine,
                                                            variant: "h6",
                                                            key: "news-title-line-" + String(index) + ""
                                                          });
                                              })))
                                  }), React.createElement(Core.Grid, {
                                    alignItems: "stretch",
                                    children: Belt_List.toArray(Belt_List.mapWithIndex(News_Latest.latestNews.content, (function (index, param) {
                                                var tmp = {
                                                  children: param.value
                                                };
                                                var tmp$1 = param.emphasis ? commonClasses.bold : undefined;
                                                if (tmp$1 !== undefined) {
                                                  tmp.className = tmp$1;
                                                }
                                                var tmp$2 = {
                                                  children: React.createElement(Core.Typography, tmp),
                                                  item: true,
                                                  key: "news-line-" + String(index) + ""
                                                };
                                                var tmp$3 = param.nextLineEmpty ? commonClasses.marginBottomSm : undefined;
                                                if (tmp$3 !== undefined) {
                                                  tmp$2.className = tmp$3;
                                                }
                                                return React.createElement(Core.Grid, tmp$2);
                                              }))),
                                    container: true,
                                    direction: "column"
                                  })),
                          item: true
                        }),
                    className: commonClasses.marginBottom,
                    container: true,
                    direction: "column"
                  }),
              in: !match[0]
            });
}

var make = News_Message;

export {
  useStyles ,
  make ,
}
/* useStyles Not a pure module */
