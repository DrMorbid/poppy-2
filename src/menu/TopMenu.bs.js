// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as TopMenu_Tabs from "./TopMenu_Tabs.bs.js";
import * as App_Icon_Menu from "../icon/App_Icon_Menu.bs.js";
import * as TopMenu_Drawer from "./TopMenu_Drawer.bs.js";
import * as Core from "@material-ui/core";

function TopMenu(Props) {
  var match = React.useState(function () {
        return false;
      });
  var setDrawerOpen = match[1];
  return React.createElement(Core.AppBar, {
              children: null,
              position: "sticky"
            }, React.createElement(TopMenu_Drawer.make, {
                  drawerOpen: match[0],
                  onClose: (function (param) {
                      Curry._1(setDrawerOpen, (function (param) {
                              return false;
                            }));
                    })
                }), React.createElement(Core.Hidden, {
                  children: React.createElement(TopMenu_Tabs.make, {}),
                  xsDown: true
                }), React.createElement(Core.Hidden, {
                  children: React.createElement(Core.Toolbar, {
                        children: React.createElement(Core.Grid, {
                              children: React.createElement(Core.Grid, {
                                    children: React.createElement(Core.IconButton, {
                                          onClick: (function (param) {
                                              Curry._1(setDrawerOpen, (function (param) {
                                                      return true;
                                                    }));
                                            }),
                                          children: React.createElement(App_Icon_Menu.make, {})
                                        }),
                                    item: true
                                  }),
                              container: true,
                              justify: "flex-end"
                            })
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
