// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Message from "../i18n/Message.bs.js";
import * as Core$Mui from "rescript-material-ui/src/Core.bs.js";
import * as Grid$Mui from "rescript-material-ui/src/Grid.bs.js";
import * as ReactIntl from "react-intl";
import * as App_Context from "../App_Context.bs.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as Common_Text from "../common/Common_Text.bs.js";
import * as Common_Style from "../common/Common_Style.bs.js";
import * as Core from "@material-ui/core";
import * as JsxRuntime from "react/jsx-runtime";
import * as Styles from "@material-ui/core/styles";

function References_Page(props) {
  var intl = ReactIntl.useIntl();
  var classes = Common_Style.useStyles();
  var match = React.useContext(App_Context.Context.t);
  var dispatch = match[1];
  var activeMenuItem = match[0].activeMenuItem;
  var isSmUp = Core.useMediaQuery(Core$Mui.Breakpoint.get(Styles.useTheme(), {
            NAME: "up",
            VAL: "sm"
          }));
  React.useEffect((function () {
          if (activeMenuItem !== /* References */3) {
            Curry._1(dispatch, /* StoreActiveMenuItem */{
                  _0: /* References */3
                });
          }
          
        }), [activeMenuItem]);
  return JsxRuntime.jsxs(Core.Grid, {
              children: [
                JsxRuntime.jsx(Core.Grid, {
                      children: Caml_option.some(JsxRuntime.jsx(Common_Text.make, {
                                header: isSmUp ? Message.References.header : undefined,
                                paragraphs: {
                                  hd: Message.References.paragraph1,
                                  tl: /* [] */0
                                }
                              })),
                      item: true
                    }),
                JsxRuntime.jsx(Core.Grid, {
                      children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                children: Caml_option.some(intl.formatMessage(Message.References.section2Header)),
                                variant: "h5"
                              })),
                      className: classes.headerGap,
                      item: true,
                      xs: Caml_option.some(Grid$Mui.Xs[12])
                    }),
                JsxRuntime.jsx(Core.Grid, {
                      children: Caml_option.some(JsxRuntime.jsxs(Core.Grid, {
                                children: [
                                  JsxRuntime.jsx(Core.Grid, {
                                        children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                                  children: Caml_option.some(intl.formatMessage(Message.References.tvAndFilmHeader)),
                                                  variant: "h6"
                                                })),
                                        item: true,
                                        xs: Caml_option.some(Grid$Mui.Xs[12])
                                      }),
                                  JsxRuntime.jsx(Core.Grid, {
                                        children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                                  children: Caml_option.some(intl.formatMessage(Message.References.tvAndFilmList))
                                                })),
                                        item: true,
                                        xs: Caml_option.some(Grid$Mui.Xs[12])
                                      }),
                                  JsxRuntime.jsx(Core.Grid, {
                                        children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                                  children: Caml_option.some(intl.formatMessage(Message.References.adsHeader)),
                                                  variant: "h6"
                                                })),
                                        item: true,
                                        xs: Caml_option.some(Grid$Mui.Xs[12])
                                      }),
                                  JsxRuntime.jsx(Core.Grid, {
                                        children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                                  children: Caml_option.some(intl.formatMessage(Message.References.adsList))
                                                })),
                                        item: true,
                                        xs: Caml_option.some(Grid$Mui.Xs[12])
                                      })
                                ],
                                className: classes.paragraphGap,
                                container: true
                              })),
                      className: classes.headerGap,
                      item: true
                    })
              ],
              container: true
            });
}

var make = References_Page;

export {
  make ,
}
/* react Not a pure module */
