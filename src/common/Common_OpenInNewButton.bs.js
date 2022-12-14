// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as ReactIntl from "react-intl";
import * as Core from "@material-ui/core";
import * as Styles from "@material-ui/styles";
import * as Common_Icon_OpenInNew from "./icon/Common_Icon_OpenInNew.bs.js";

var useStyles = Styles.makeStyles({
      root: {
        textTransform: "none"
      }
    });

function Common_OpenInNewButton(Props) {
  var label = Props.label;
  var onClick = Props.onClick;
  var intl = ReactIntl.useIntl();
  var classes = useStyles();
  return React.createElement(Core.Button, {
              onClick: (function (param) {
                  Curry._1(onClick, undefined);
                }),
              children: intl.formatMessage(label),
              classes: {
                root: classes.root
              },
              endIcon: React.createElement(Common_Icon_OpenInNew.make, {}),
              variant: "outlined"
            });
}

var make = Common_OpenInNewButton;

export {
  useStyles ,
  make ,
}
/* useStyles Not a pure module */
