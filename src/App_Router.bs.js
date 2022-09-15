// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as App_Page from "./App_Page.bs.js";
import * as AboutUs_Page from "./aboutUs/AboutUs_Page.bs.js";
import * as Contact_Page from "./contact/Contact_Page.bs.js";
import * as References_Page from "./references/References_Page.bs.js";
import * as Registrations_Page from "./registrations/Registrations_Page.bs.js";
import * as RescriptReactRouter from "@rescript/react/src/RescriptReactRouter.bs.js";

function App_Router(Props) {
  var url = RescriptReactRouter.useUrl(undefined, undefined);
  var match = url.path;
  if (match) {
    switch (match.hd) {
      case "about-us" :
          if (!match.tl) {
            return React.createElement(AboutUs_Page.make, {});
          }
          break;
      case "contact" :
          if (!match.tl) {
            return React.createElement(Contact_Page.make, {});
          }
          break;
      case "references" :
          if (!match.tl) {
            return React.createElement(References_Page.make, {});
          }
          break;
      case "registrations" :
          if (!match.tl) {
            return React.createElement(Registrations_Page.make, {});
          }
          break;
      default:
        
    }
  }
  RescriptReactRouter.push(App_Page.toRoutePath(/* AboutUs */0));
  return React.createElement(AboutUs_Page.make, {});
}

var make = App_Router;

export {
  make ,
}
/* react Not a pure module */