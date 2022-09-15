// Generated by ReScript, PLEASE EDIT WITH CARE

import * as App from "./App.bs.js";
import * as React from "react";
import * as App_Theme from "./theme/App_Theme.bs.js";
import * as App_Context from "./App_Context.bs.js";
import * as IntlProvider from "./i18n/IntlProvider.bs.js";
import * as Core from "@material-ui/core";
import * as Styles from "@material-ui/core/styles";

function Root(Props) {
  var prefersDarkTheme = Core.useMediaQuery("(prefers-color-scheme: dark)");
  return React.createElement(IntlProvider.make, {
              children: React.createElement(App_Context.Provider.make, {
                    children: React.createElement(Styles.ThemeProvider, {
                          children: null,
                          theme: App_Theme.theme(prefersDarkTheme)
                        }, React.createElement(Core.CssBaseline, {}), React.createElement(App.make, {}))
                  })
            });
}

var make = Root;

export {
  make ,
}
/* App Not a pure module */