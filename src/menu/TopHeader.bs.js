// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Message from "../i18n/Message.bs.js";
import * as ReactIntl from "react-intl";
import * as Common_Constants from "../common/Common_Constants.bs.js";
import * as Core from "@material-ui/core";
import * as Styles from "@material-ui/styles";
import * as TopHeader_Container from "./TopHeader_Container.bs.js";
import * as Common_Button_WithIcon from "../common/button/Common_Button_WithIcon.bs.js";

var useStyles = Styles.makeStyles({
      logoContainer: {
        width: "25%"
      },
      logo: {
        height: "11vw"
      }
    });

function TopHeader(Props) {
  var intl = ReactIntl.useIntl();
  var classes = useStyles();
  var onEmailUs = function (e) {
    window.location.href = "mailto:" + Common_Constants.infoEmail + "";
    e.preventDefault();
  };
  return React.createElement(TopHeader_Container.make, {
              children: null
            }, React.createElement(Core.Grid, {
                  children: React.createElement(Common_Button_WithIcon.make, {
                        label: Message.Menu.emailUs,
                        onClick: onEmailUs
                      }),
                  item: true
                }), React.createElement(Core.Hidden, {
                  children: React.createElement(Core.Grid, {
                        children: React.createElement(Core.Card, {
                              children: React.createElement(Core.CardMedia, {
                                    className: classes.logo,
                                    image: "/poppy_logo.jpg"
                                  })
                            }),
                        className: classes.logoContainer,
                        item: true
                      }),
                  smDown: true
                }), React.createElement(Core.Grid, {
                  children: React.createElement(Core.Button, {
                        children: intl.formatMessage(Message.Menu.register),
                        color: "secondary",
                        variant: "contained"
                      }),
                  item: true
                }));
}

var Container;

var make = TopHeader;

export {
  Container ,
  useStyles ,
  make ,
}
/* useStyles Not a pure module */
