open Mui
open ReactDOM
open Utils.Style

module Classes = {
  let photo = (theme: Theme.t) =>
    list{
      Style.make(~width="9rem", ~height="9rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Float.toString,
      ),
      Style.make(~width="13rem", ~height="13rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Float.toString,
      ),
      Style.make(~width="14rem", ~height="14rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Float.toString,
      ),
      Style.make(~width="17rem", ~height="17rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Float.toString,
      ),
    }
    ->stylesCombiner
    ->Emotion.styleToClass
}

@react.component
let make = (~src) => {
  let theme = MuiStyles.useTheme()

  <Avatar src className={theme->Classes.photo} />
}
