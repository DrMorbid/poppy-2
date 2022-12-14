// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Grid$Mui from "rescript-material-ui/src/Grid.bs.js";
import * as Belt_List from "rescript/lib/es6/belt_List.js";
import * as ReactIntl from "react-intl";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Common_Style from "./Common_Style.bs.js";
import * as Core from "@material-ui/core";

function Common_Text(Props) {
  var header = Props.header;
  var afterHeader = Props.afterHeader;
  var paragraphs = Props.paragraphs;
  var centerAll = Props.centerAll;
  var intl = ReactIntl.useIntl();
  var classes = Common_Style.useStyles();
  var getContainerClassname = function (param) {
    return Belt_List.reduce(Belt_List.concat({
                    hd: classes.paragraphGap,
                    tl: /* [] */0
                  }, Belt_Option.mapWithDefault(centerAll, /* [] */0, (function (centerAll) {
                          if (centerAll) {
                            return {
                                    hd: classes.centeredText,
                                    tl: /* [] */0
                                  };
                          } else {
                            return /* [] */0;
                          }
                        }))), "", (function (result, className) {
                  return "" + result + " " + className + "";
                }));
  };
  return React.createElement(Core.Grid, {
              children: null,
              className: getContainerClassname(undefined),
              container: true
            }, Belt_Option.mapWithDefault(header, null, (function (header) {
                    return React.createElement(Core.Grid, {
                                children: React.createElement(Core.Typography, {
                                      children: intl.formatMessage(header),
                                      variant: "h4"
                                    }),
                                className: classes.centeredText,
                                item: true,
                                xs: Grid$Mui.Xs[12]
                              });
                  })), Belt_Option.mapWithDefault(afterHeader, null, (function (afterHeader) {
                    return React.createElement(Core.Grid, {
                                children: afterHeader,
                                item: true,
                                xs: Grid$Mui.Xs[12]
                              });
                  })), Belt_List.toArray(Belt_List.mapWithIndex(paragraphs, (function (index, paragraph) {
                        return React.createElement(Core.Grid, {
                                    children: React.createElement(Core.Typography, {
                                          children: intl.formatMessage(paragraph)
                                        }),
                                    item: true,
                                    xs: Grid$Mui.Xs[12],
                                    key: "paragraph-" + String(index) + ""
                                  });
                      }))));
}

var make = Common_Text;

export {
  make ,
}
/* react Not a pure module */
