open Mui
open ReactDOM
open Utils.Style

module Classes = {
  let photo =
    list{
      Style.make(~width="9rem", ~height="9rem", ())->styleWithMediaQuery(
        ~addMediaPrefix=true,
        ~mediaQuery=App_Theme.Breakpoint.xsUp,
      ),
      Style.make(~width="13rem", ~height="13rem", ())->styleWithMediaQuery(
        ~addMediaPrefix=true,
        ~mediaQuery=App_Theme.Breakpoint.smUp,
      ),
      Style.make(~width="14rem", ~height="14rem", ())->styleWithMediaQuery(
        ~addMediaPrefix=true,
        ~mediaQuery=App_Theme.Breakpoint.mdUp,
      ),
      Style.make(~width="17rem", ~height="17rem", ())->styleWithMediaQuery(
        ~addMediaPrefix=true,
        ~mediaQuery=App_Theme.Breakpoint.lgUp,
      ),
    }
    ->stylesCombiner
    ->Emotion.styleToClass
}

@react.component
let make = (~src) => {
  <Avatar src className=Classes.photo />
}
