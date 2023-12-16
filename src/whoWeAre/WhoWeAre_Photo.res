open Mui
open ReactDOM
open Utils.Style

module Classes = {
  let photo =
    list{
      Style.make(~width="9rem !important", ~height="9rem !important", ())->styleWithMediaQuery(
        ~addMediaPrefix=true,
        ~mediaQuery=App_Theme.Breakpoint.xsUp,
      ),
      Style.make(~width="13rem !important", ~height="13rem !important", ())->styleWithMediaQuery(
        ~addMediaPrefix=true,
        ~mediaQuery=App_Theme.Breakpoint.smUp,
      ),
      Style.make(~width="14rem !important", ~height="14rem !important", ())->styleWithMediaQuery(
        ~addMediaPrefix=true,
        ~mediaQuery=App_Theme.Breakpoint.mdUp,
      ),
      Style.make(~width="17rem !important", ~height="17rem !important", ())->styleWithMediaQuery(
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
