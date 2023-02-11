// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";

function menuItems(isLatestNewsRead) {
  if (isLatestNewsRead) {
    return {
            hd: /* LatestNews */0,
            tl: {
              hd: /* AboutUs */1,
              tl: {
                hd: /* References */2,
                tl: {
                  hd: /* Contact */3,
                  tl: /* [] */0
                }
              }
            }
          };
  } else {
    return {
            hd: /* AboutUs */1,
            tl: {
              hd: /* References */2,
              tl: {
                hd: /* Contact */3,
                tl: /* [] */0
              }
            }
          };
  }
}

function onClick(onSuccessOpt, homeSection) {
  var onSuccess = onSuccessOpt !== undefined ? onSuccessOpt : (function (param) {
        
      });
  switch (homeSection) {
    case /* LatestNews */0 :
        console.log("Scrolling to latest news");
        break;
    case /* AboutUs */1 :
        console.log("Scrolling to about us");
        break;
    case /* References */2 :
        console.log("Scrolling to references");
        break;
    case /* Contact */3 :
        console.log("Scrolling to contact");
        break;
    
  }
  Curry._1(onSuccess, undefined);
}

export {
  menuItems ,
  onClick ,
}
/* No side effect */
