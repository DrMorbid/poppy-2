// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Belt_List from "rescript/lib/es6/belt_List.js";
import * as ReactIntl from "react-intl";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Core from "@material-ui/core";
import * as Styles from "@material-ui/styles";

var useStyles = Styles.makeStyles({
      container: {
        gridRowGap: "1rem"
      }
    });

function Common_Text(Props) {
  var header = Props.header;
  var paragraphs = Props.paragraphs;
  var intl = ReactIntl.useIntl();
  var classes = useStyles();
  return React.createElement(Core.Grid, {
              children: null,
              className: classes.container,
              container: true
            }, Belt_Option.mapWithDefault(header, null, (function (header) {
                    return React.createElement(Core.Grid, {
                                children: React.createElement(Core.Typography, {
                                      children: intl.formatMessage(header),
                                      variant: "h4"
                                    }),
                                item: true
                              });
                  })), Belt_List.toArray(Belt_List.map(paragraphs, (function (paragraph) {
                        return React.createElement(Core.Grid, {
                                    children: React.createElement(Core.Typography, {
                                          children: intl.formatMessage(paragraph)
                                        }),
                                    item: true
                                  });
                      }))));
}

var make = Common_Text;

export {
  useStyles ,
  make ,
}
/* useStyles Not a pure module */
