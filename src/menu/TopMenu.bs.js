// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as App_Page from "../App_Page.bs.js";
import * as News_Idb from "../news/News_Idb.bs.js";
import * as ReactIntl from "react-intl";
import * as App_Context from "../App_Context.bs.js";
import * as TopMenu_Tabs from "./TopMenu_Tabs.bs.js";
import * as TopMenu_Drawer from "./TopMenu_Drawer.bs.js";
import * as Common_Icon_Menu from "../common/icon/Common_Icon_Menu.bs.js";
import * as Core from "@material-ui/core";

function TopMenu(Props) {
  var match = React.useState(function () {
        return false;
      });
  var setIsLatestNewsRead = match[1];
  var isLatestNewsRead = match[0];
  var match$1 = React.useState(function () {
        return false;
      });
  var setDrawerOpen = match$1[1];
  var intl = ReactIntl.useIntl();
  var match$2 = React.useContext(App_Context.Context.t);
  var match$3 = match$2[0];
  React.useEffect((function () {
          News_Idb.isLatestNewsRead(undefined).then(function (isLatestNewsRead) {
                Curry._1(setIsLatestNewsRead, (function (param) {
                        return isLatestNewsRead;
                      }));
              });
        }), [match$3.latestNewsClosed]);
  return React.createElement(Core.AppBar, {
              children: null,
              position: "relative"
            }, React.createElement(TopMenu_Drawer.make, {
                  drawerOpen: match$1[0],
                  onClose: (function (param) {
                      Curry._1(setDrawerOpen, (function (param) {
                              return false;
                            }));
                    }),
                  isLatestNewsRead: isLatestNewsRead
                }), React.createElement(Core.Hidden, {
                  children: React.createElement(TopMenu_Tabs.make, {
                        isLatestNewsRead: isLatestNewsRead
                      }),
                  xsDown: true
                }), React.createElement(Core.Hidden, {
                  children: React.createElement(Core.Toolbar, {
                        children: React.createElement(Core.Grid, {
                              alignItems: "center",
                              children: null,
                              container: true,
                              justify: "space-between"
                            }, React.createElement(Core.Grid, {
                                  children: React.createElement(Core.Typography, {
                                        children: intl.formatMessage(App_Page.toLabel(match$3.activeMenuItem)),
                                        variant: "h5"
                                      }),
                                  item: true
                                }), React.createElement(Core.Grid, {
                                  children: React.createElement(Core.IconButton, {
                                        onClick: (function (param) {
                                            Curry._1(setDrawerOpen, (function (param) {
                                                    return true;
                                                  }));
                                          }),
                                        children: React.createElement(Common_Icon_Menu.make, {})
                                      }),
                                  item: true
                                }))
                      }),
                  smUp: true
                }));
}

var Drawer;

var Tabs;

var make = TopMenu;

export {
  Drawer ,
  Tabs ,
  make ,
}
/* react Not a pure module */
