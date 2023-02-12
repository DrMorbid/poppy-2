// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Grid$Mui from "rescript-material-ui/src/Grid.bs.js";
import * as Belt_List from "rescript/lib/es6/belt_List.js";
import * as ReactIntl from "react-intl";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as Common_Style from "./Common_Style.bs.js";
import * as Core from "@material-ui/core";
import * as JsxRuntime from "react/jsx-runtime";

function Common_Text(props) {
  var centerAll = props.centerAll;
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
  return JsxRuntime.jsxs(Core.Grid, {
              children: [
                Belt_Option.mapWithDefault(props.header, null, (function (header) {
                        return JsxRuntime.jsx(Core.Grid, {
                                    children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                              children: Caml_option.some(intl.formatMessage(header)),
                                              variant: "h2"
                                            })),
                                    className: classes.centeredText,
                                    item: true,
                                    xs: Caml_option.some(Grid$Mui.Xs[12])
                                  });
                      })),
                Belt_Option.mapWithDefault(props.afterHeader, null, (function (afterHeader) {
                        return JsxRuntime.jsx(Core.Grid, {
                                    children: Caml_option.some(afterHeader),
                                    item: true,
                                    xs: Caml_option.some(Grid$Mui.Xs[12])
                                  });
                      })),
                Belt_List.toArray(Belt_List.mapWithIndex(props.paragraphs, (function (index, paragraph) {
                            return JsxRuntime.jsx(Core.Grid, {
                                        children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                                  children: Caml_option.some(intl.formatMessage(paragraph))
                                                })),
                                        item: true,
                                        xs: Caml_option.some(Grid$Mui.Xs[12])
                                      }, "paragraph-" + String(index) + "");
                          })))
              ],
              className: getContainerClassname(undefined),
              container: true
            });
}

var make = Common_Text;

export {
  make ,
}
/* react-intl Not a pure module */
