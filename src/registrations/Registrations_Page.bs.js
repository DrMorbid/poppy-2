// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Message from "../i18n/Message.bs.js";
import * as Core$Mui from "rescript-material-ui/src/Core.bs.js";
import * as App_Context from "../App_Context.bs.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as Common_Text from "../common/Common_Text.bs.js";
import * as News_Message from "../news/News_Message.bs.js";
import * as Common_Dialog from "../common/Common_Dialog.bs.js";
import * as Core from "@material-ui/core";
import * as JsxRuntime from "react/jsx-runtime";
import * as Common_OpenInNewButton from "../common/Common_OpenInNewButton.bs.js";
import * as Styles from "@material-ui/core/styles";

function Registrations_Page(props) {
  var match = React.useState(function () {
        return false;
      });
  var setDialogOpened = match[1];
  var match$1 = React.useContext(App_Context.Context.t);
  var dispatch = match$1[1];
  var activeMenuItem = match$1[0].activeMenuItem;
  var isSmUp = Core.useMediaQuery(Core$Mui.Breakpoint.get(Styles.useTheme(), {
            NAME: "up",
            VAL: "sm"
          }));
  React.useEffect((function () {
          if (activeMenuItem !== /* Registrations */1) {
            Curry._1(dispatch, /* StoreActiveMenuItem */{
                  _0: /* Registrations */1
                });
          }
          
        }), [activeMenuItem]);
  var onOpen = function (param) {
    Curry._1(setDialogOpened, (function (param) {
            return true;
          }));
  };
  var onClose = function (param) {
    Curry._1(setDialogOpened, (function (param) {
            return false;
          }));
  };
  return JsxRuntime.jsxs(JsxRuntime.Fragment, {
              children: [
                JsxRuntime.jsx(Common_Dialog.make, {
                      isOpen: match[0],
                      onClose: onClose,
                      children: JsxRuntime.jsx(News_Message.Content.make, {})
                    }),
                JsxRuntime.jsx(Common_Text.make, {
                      header: isSmUp ? Message.Registrations.header : undefined,
                      afterHeader: Caml_option.some(JsxRuntime.jsx(Common_OpenInNewButton.make, {
                                label: Message.Registrations.nextRegistrations,
                                onClick: onOpen
                              })),
                      body: {
                        TAG: /* Paragraphs */0,
                        _0: {
                          hd: Message.Registrations.paragraph1,
                          tl: {
                            hd: Message.Registrations.paragraph2,
                            tl: {
                              hd: Message.Registrations.paragraph3,
                              tl: {
                                hd: Message.Registrations.paragraph4,
                                tl: /* [] */0
                              }
                            }
                          }
                        }
                      }
                    })
              ]
            });
}

var make = Registrations_Page;

export {
  make ,
}
/* react Not a pure module */
