// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Js_dict from "rescript/lib/es6/js_dict.js";
import * as Belt_List from "rescript/lib/es6/belt_List.js";

function addMediaQuery(addMediaPrefixOpt, mediaQuery, style) {
  var addMediaPrefix = addMediaPrefixOpt !== undefined ? addMediaPrefixOpt : false;
  return Js_dict.fromList({
              hd: [
                (
                  addMediaPrefix ? "@media " : ""
                ) + mediaQuery,
                style
              ],
              tl: /* [] */0
            });
}

function styleWithMediaQuery(addMediaPrefixOpt, mediaQuery, style) {
  var addMediaPrefix = addMediaPrefixOpt !== undefined ? addMediaPrefixOpt : false;
  return addMediaQuery(addMediaPrefix, mediaQuery, style);
}

function stylesCombiner(listOfStyles) {
  return Belt_List.reduce(listOfStyles, {}, (function (acumulator, additionalStyle) {
                return Object.assign({}, acumulator, additionalStyle);
              }));
}

export {
  addMediaQuery ,
  styleWithMediaQuery ,
  stylesCombiner ,
}
/* No side effect */