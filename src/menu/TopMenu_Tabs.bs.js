// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Belt_List from "rescript/lib/es6/belt_List.js";
import * as ReactIntl from "react-intl";
import * as App_Context from "../App_Context.bs.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as Home_Section from "../home/Home_Section.bs.js";
import * as TopMenu_Item from "./TopMenu_Item.bs.js";
import * as Core from "@material-ui/core";
import * as JsxRuntime from "react/jsx-runtime";

function TopMenu_Tabs(props) {
  var intl = ReactIntl.useIntl();
  var match = React.useContext(App_Context.Context.t);
  return JsxRuntime.jsx(Core.Tabs, {
              children: Caml_option.some(Belt_List.toArray(Belt_List.map(TopMenu_Item.menuItems(props.isLatestNewsRead), (function (section) {
                              return JsxRuntime.jsx(Core.Tab, {
                                          label: Caml_option.some(intl.formatMessage(Home_Section.toLabel(section))),
                                          onClick: (function (param) {
                                              TopMenu_Item.onClick(undefined, section);
                                            }),
                                          value: Caml_option.some(section)
                                        });
                            })))),
              value: Caml_option.some(match[0].activeMenuItem),
              variant: "fullWidth"
            });
}

var make = TopMenu_Tabs;

export {
  make ,
}
/* react Not a pure module */
