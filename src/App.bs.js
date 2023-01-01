// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as TopMenu from "./menu/TopMenu.bs.js";
import * as TopHeader from "./menu/TopHeader.bs.js";
import * as App_Router from "./App_Router.bs.js";
import * as App_Context from "./App_Context.bs.js";
import * as Utils_Style from "./utils/Utils_Style.bs.js";
import * as Common_Style from "./common/Common_Style.bs.js";
import * as News_Message from "./news/News_Message.bs.js";
import * as Contact_Content from "./contact/Contact_Content.bs.js";
import * as Core from "@material-ui/core";
import * as Styles from "@material-ui/styles";

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

function App(Props) {
  var classes = useStyles();
  var commonClasses = Common_Style.useStyles();
  var match = React.useContext(App_Context.Context.t);
  return React.createElement(Core.Container, {
              children: React.createElement(Core.Grid, {
                    children: null,
                    className: commonClasses.paragraphGap,
                    container: true,
                    direction: "column"
                  }, React.createElement(Core.Grid, {
                        children: React.createElement(TopHeader.make, {}),
                        item: true
                      }), React.createElement(Core.Grid, {
                        children: React.createElement(TopMenu.make, {}),
                        item: true
                      }), React.createElement(Core.Grid, {
                        children: React.createElement(News_Message.make, {}),
                        item: true
                      }), React.createElement(Core.Grid, {
                        children: React.createElement(App_Router.make, {}),
                        item: true
                      }), React.createElement(Core.Hidden, {
                        children: React.createElement(Core.Grid, {
                              children: React.createElement(Contact_Content.make, {}),
                              item: true
                            }),
                        xsUp: match[0].activeMenuItem === /* Contact */4
                      })),
              className: classes.container
            });
}

var Theme;

var Context;

var Actions;

var Page;

var Router;

var make = App;

export {
  Theme ,
  Context ,
  Actions ,
  Page ,
  Router ,
  useStyles ,
  make ,
}
/* useStyles Not a pure module */
