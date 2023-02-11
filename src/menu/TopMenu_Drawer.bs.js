// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as Belt_List from "rescript/lib/es6/belt_List.js";
import * as ReactIntl from "react-intl";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as Home_Section from "../home/Home_Section.bs.js";
import * as TopMenu_Item from "./TopMenu_Item.bs.js";
import * as Core from "@material-ui/core";
import * as JsxRuntime from "react/jsx-runtime";
import * as Styles from "@material-ui/styles";

var useStyles = Styles.makeStyles({
      list: {
        width: "50vw"
      }
    });

function TopMenu_Drawer(props) {
  var onClose = props.onClose;
  var intl = ReactIntl.useIntl();
  var classes = useStyles();
  return JsxRuntime.jsx(Core.Drawer, {
              children: Caml_option.some(JsxRuntime.jsx(Core.List, {
                        children: Caml_option.some(Belt_List.toArray(Belt_List.map(TopMenu_Item.menuItems(props.isLatestNewsRead), (function (section) {
                                        return JsxRuntime.jsx(Core.ListItem, {
                                                    button: true,
                                                    children: Caml_option.some(JsxRuntime.jsx(Core.ListItemText, {
                                                              primary: Caml_option.some(intl.formatMessage(Home_Section.toLabel(section)))
                                                            })),
                                                    onClick: (function (param) {
                                                        TopMenu_Item.onClick(onClose, section);
                                                      })
                                                  });
                                      })))),
                        className: classes.list
                      })),
              onClose: (function (param) {
                  Curry._1(onClose, undefined);
                }),
              open: props.drawerOpen
            });
}

var make = TopMenu_Drawer;

export {
  useStyles ,
  make ,
}
/* useStyles Not a pure module */
