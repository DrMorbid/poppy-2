// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Message from "../i18n/Message.bs.js";
import * as Core$Mui from "rescript-material-ui/src/Core.bs.js";
import * as Grid$Mui from "rescript-material-ui/src/Grid.bs.js";
import * as ReactIntl from "react-intl";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as Contact_Map from "./Contact_Map.bs.js";
import * as Common_Style from "../common/Common_Style.bs.js";
import * as Common_Dialog from "../common/Common_Dialog.bs.js";
import * as Common_Constants from "../common/Common_Constants.bs.js";
import * as Core from "@material-ui/core";
import * as JsxRuntime from "react/jsx-runtime";
import * as Styles from "@material-ui/styles";
import * as Common_OpenInNewButton from "../common/Common_OpenInNewButton.bs.js";
import * as Styles$1 from "@material-ui/core/styles";

var useStyles = Styles.makeStyles({
      mapSize: {
        height: "50%",
        width: "100%"
      }
    });

function Contact_Content_Simple(props) {
  var match = React.useState(function () {
        
      });
  var setMapUrl = match[1];
  var mapUrl = match[0];
  var match$1 = React.useState(function () {
        return false;
      });
  var setIsMapBeingLoaded = match$1[1];
  var intl = ReactIntl.useIntl();
  var commonClasses = Common_Style.useStyles();
  useStyles();
  var isMdUp = Core.useMediaQuery(Core$Mui.Breakpoint.get(Styles$1.useTheme(), {
            NAME: "up",
            VAL: "md"
          }));
  var onClose = function (param) {
    Curry._1(setIsMapBeingLoaded, (function (param) {
            return false;
          }));
    Curry._1(setMapUrl, (function (param) {
            
          }));
  };
  var onMapLoadingFinished = function (param) {
    Curry._1(setIsMapBeingLoaded, (function (param) {
            return false;
          }));
  };
  return JsxRuntime.jsxs(Core.Grid, {
              children: [
                JsxRuntime.jsx(Core.Grid, {
                      children: Caml_option.some(JsxRuntime.jsxs(Core.Grid, {
                                children: [
                                  JsxRuntime.jsx(Core.Grid, {
                                        children: Caml_option.some(JsxRuntime.jsxs(Core.Grid, {
                                                  children: [
                                                    JsxRuntime.jsx(Core.Grid, {
                                                          children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                                                    children: Caml_option.some(intl.formatMessage(Message.Contact.registrationDatabaseTitle)),
                                                                    className: commonClasses.bold
                                                                  })),
                                                          item: true,
                                                          xs: Caml_option.some(Grid$Mui.Xs[12])
                                                        }),
                                                    JsxRuntime.jsx(Core.Grid, {
                                                          children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                                                    children: Caml_option.some(intl.formatMessage(Message.Contact.registrationDatabasePerson))
                                                                  })),
                                                          item: true,
                                                          xs: Caml_option.some(Grid$Mui.Xs[12])
                                                        }),
                                                    JsxRuntime.jsx(Core.Grid, {
                                                          children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                                                    children: Caml_option.some(Common_Constants.infoPhone)
                                                                  })),
                                                          item: true,
                                                          xs: Caml_option.some(Grid$Mui.Xs[12])
                                                        }),
                                                    JsxRuntime.jsx(Core.Grid, {
                                                          children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                                                    children: Caml_option.some(Common_Constants.infoEmail)
                                                                  })),
                                                          item: true,
                                                          xs: Caml_option.some(Grid$Mui.Xs[12])
                                                        })
                                                  ],
                                                  container: true
                                                })),
                                        item: true,
                                        md: Caml_option.some(Grid$Mui.Md[4]),
                                        sm: Caml_option.some(Grid$Mui.Sm[6]),
                                        xs: Caml_option.some(Grid$Mui.Xs[12])
                                      }),
                                  JsxRuntime.jsx(Core.Grid, {
                                        children: Caml_option.some(JsxRuntime.jsxs(Core.Grid, {
                                                  children: [
                                                    JsxRuntime.jsx(Core.Grid, {
                                                          children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                                                    children: Caml_option.some(intl.formatMessage(Message.Contact.clientsProductionDirectionTitle)),
                                                                    className: commonClasses.bold
                                                                  })),
                                                          item: true,
                                                          xs: Caml_option.some(Grid$Mui.Xs[12])
                                                        }),
                                                    JsxRuntime.jsx(Core.Grid, {
                                                          children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                                                    children: Caml_option.some(intl.formatMessage(Message.Contact.clientsProductionDirectionPerson))
                                                                  })),
                                                          item: true,
                                                          xs: Caml_option.some(Grid$Mui.Xs[12])
                                                        }),
                                                    JsxRuntime.jsx(Core.Grid, {
                                                          children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                                                    children: Caml_option.some(Common_Constants.bossEmail)
                                                                  })),
                                                          item: true,
                                                          xs: Caml_option.some(Grid$Mui.Xs[12])
                                                        })
                                                  ],
                                                  container: true
                                                })),
                                        item: true,
                                        md: Caml_option.some(Grid$Mui.Md[4]),
                                        sm: Caml_option.some(Grid$Mui.Sm[6]),
                                        xs: Caml_option.some(Grid$Mui.Xs[12])
                                      }),
                                  JsxRuntime.jsx(Core.Grid, {
                                        children: Caml_option.some(JsxRuntime.jsxs(Core.Grid, {
                                                  children: [
                                                    JsxRuntime.jsx(Core.Grid, {
                                                          children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                                                    children: Caml_option.some(intl.formatMessage(Message.Contact.studioRegistrationsTitle)),
                                                                    className: commonClasses.bold
                                                                  })),
                                                          item: true,
                                                          xs: Caml_option.some(Grid$Mui.Xs[12])
                                                        }),
                                                    JsxRuntime.jsx(Core.Grid, {
                                                          children: Caml_option.some(JsxRuntime.jsx(Common_OpenInNewButton.make, {
                                                                    label: Message.Contact.registrationAddress,
                                                                    onClick: (function (param) {
                                                                        var mapUrl = Common_Constants.registrationAddressMapUrl;
                                                                        Curry._1(setIsMapBeingLoaded, (function (param) {
                                                                                return true;
                                                                              }));
                                                                        return Curry._1(setMapUrl, (function (param) {
                                                                                      return mapUrl;
                                                                                    }));
                                                                      })
                                                                  })),
                                                          item: true,
                                                          xs: Caml_option.some(Grid$Mui.Xs[12])
                                                        })
                                                  ],
                                                  container: true
                                                })),
                                        item: true,
                                        md: Caml_option.some(Grid$Mui.Md[4]),
                                        xs: Caml_option.some(Grid$Mui.Xs[12])
                                      }),
                                  JsxRuntime.jsx(Core.Grid, {
                                        children: Caml_option.some(JsxRuntime.jsx(Core.Grid, {
                                                  children: Caml_option.some(JsxRuntime.jsx(Core.Grid, {
                                                            children: Caml_option.some(JsxRuntime.jsx(Core.Typography, {
                                                                      children: Caml_option.some(intl.formatMessage(Message.Contact.castingsInfo))
                                                                    })),
                                                            item: true,
                                                            xs: Caml_option.some(Grid$Mui.Xs[12])
                                                          })),
                                                  container: true
                                                })),
                                        item: true,
                                        xs: Caml_option.some(Grid$Mui.Xs[12])
                                      })
                                ],
                                className: commonClasses.paragraphGap,
                                container: true
                              })),
                      item: true,
                      xs: Caml_option.some(Grid$Mui.Xs[12])
                    }),
                JsxRuntime.jsx(Common_Dialog.make, {
                      isOpen: Belt_Option.isSome(mapUrl),
                      onClose: onClose,
                      children: JsxRuntime.jsx(Contact_Map.make, {
                            url: mapUrl,
                            isMapBeingLoaded: match$1[0],
                            onMapLoadingFinished: onMapLoadingFinished
                          }),
                      fullScreen: !isMdUp,
                      fixedSize: isMdUp
                    })
              ],
              container: true
            });
}

var make = Contact_Content_Simple;

export {
  useStyles ,
  make ,
}
/* useStyles Not a pure module */
