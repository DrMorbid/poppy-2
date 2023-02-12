// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Message from "../i18n/Message.bs.js";
import * as ReactIntl from "react-intl";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as Common_Style from "../common/Common_Style.bs.js";
import * as News_Message from "./News_Message.bs.js";
import * as Core from "@material-ui/core";
import * as JsxRuntime from "react/jsx-runtime";

function News_Section(props) {
  var intl = ReactIntl.useIntl();
  var classes = Common_Style.useStyles();
  return JsxRuntime.jsxs(Core.Grid, {
              children: [
                JsxRuntime.jsx(Core.Grid, {
                      children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                children: Caml_option.some(intl.formatMessage(Message.News.header)),
                                variant: "h1"
                              })),
                      item: true
                    }),
                JsxRuntime.jsx(Core.Grid, {
                      children: Caml_option.some(JsxRuntime.jsx(News_Message.Content.make, {
                                displayDate: false
                              })),
                      item: true
                    })
              ],
              className: classes.paragraphGap,
              container: true
            });
}

var make = News_Section;

export {
  make ,
}
/* react-intl Not a pure module */
