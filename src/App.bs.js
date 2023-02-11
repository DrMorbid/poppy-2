// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as TopMenu from "./menu/TopMenu.bs.js";
import * as Core$Mui from "rescript-material-ui/src/Core.bs.js";
import * as TopHeader from "./menu/TopHeader.bs.js";
import * as App_Router from "./App_Router.bs.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as Utils_Style from "./utils/Utils_Style.bs.js";
import * as Common_Style from "./common/Common_Style.bs.js";
import * as News_Message from "./news/News_Message.bs.js";
import * as App_ScrollToTop from "./App_ScrollToTop.bs.js";
import * as Core from "@material-ui/core";
import * as JsxRuntime from "react/jsx-runtime";
import * as Styles from "@material-ui/styles";
import * as Contact_Content_Simple from "./contact/Contact_Content_Simple.bs.js";
import * as Styles$1 from "@material-ui/core/styles";
import * as Common_Icon_KeyboardArrowUp from "./common/icon/Common_Icon_KeyboardArrowUp.bs.js";

var useStyles = Styles.makeStyles(function (theme) {
      return {
              container: Utils_Style.stylesCombiner({
                    hd: Utils_Style.styleWithMediaQuery(undefined, Curry._1(theme.breakpoints.up, "sm"), Common_Style.headerGap),
                    tl: {
                      hd: Utils_Style.styleWithMediaQuery(undefined, Curry._1(theme.breakpoints.down, "sm"), {
                            marginTop: "1rem"
                          }),
                      tl: /* [] */0
                    }
                  })
            };
    });

function App(props) {
  var classes = useStyles();
  var commonClasses = Common_Style.useStyles();
  var isSmUp = Core.useMediaQuery(Core$Mui.Breakpoint.get(Styles$1.useTheme(), {
            NAME: "up",
            VAL: "sm"
          }));
  var isMdUp = Core.useMediaQuery(Core$Mui.Breakpoint.get(Styles$1.useTheme(), {
            NAME: "up",
            VAL: "md"
          }));
  return JsxRuntime.jsxs(Core.Container, {
              children: [
                JsxRuntime.jsxs(Core.Grid, {
                      children: [
                        JsxRuntime.jsx(Core.Grid, {
                              children: Caml_option.some(JsxRuntime.jsx(TopHeader.make, {})),
                              item: true,
                              id: "back-to-top-anchor"
                            }),
                        JsxRuntime.jsx(Core.Grid, {
                              children: Caml_option.some(JsxRuntime.jsx(TopMenu.make, {})),
                              item: true
                            }),
                        JsxRuntime.jsx(Core.Grid, {
                              children: Caml_option.some(JsxRuntime.jsx(News_Message.make, {})),
                              item: true
                            }),
                        JsxRuntime.jsx(Core.Grid, {
                              children: Caml_option.some(JsxRuntime.jsx(App_Router.make, {})),
                              item: true
                            }),
                        JsxRuntime.jsx(Core.Grid, {
                              children: Caml_option.some(JsxRuntime.jsx("hr", {})),
                              item: true
                            }),
                        JsxRuntime.jsx(Core.Grid, {
                              children: Caml_option.some(JsxRuntime.jsx(Contact_Content_Simple.make, {})),
                              item: true
                            })
                      ],
                      className: commonClasses.paragraphGap,
                      container: true,
                      direction: "column"
                    }),
                JsxRuntime.jsx(Core.Snackbar, {}),
                JsxRuntime.jsx(App_ScrollToTop.make, {
                      children: JsxRuntime.jsx(Core.Fab, {
                            children: Caml_option.some(JsxRuntime.jsx(Common_Icon_KeyboardArrowUp.make, {})),
                            color: "secondary",
                            size: isSmUp ? (
                                isMdUp ? "large" : "medium"
                              ) : (
                                isMdUp ? "large" : "small"
                              )
                          })
                    })
              ],
              className: classes.container
            });
}

var Theme;

var Context;

var Actions;

var Page;

var Router;

var ScrollToTop;

var make = App;

export {
  Theme ,
  Context ,
  Actions ,
  Page ,
  Router ,
  ScrollToTop ,
  useStyles ,
  make ,
}
/* useStyles Not a pure module */
