open Mui
open ReactDOM
open Utils.Style

let useStyles: Styles.useStyles<{
  "photo": string,
}> = Styles.makeStylesWithTheme(theme => {
  {
    "photo": list{
      Style.make(~width="9rem", ~height="9rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("xs"),
      ),
      Style.make(~width="13rem", ~height="13rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("sm"),
      ),
      Style.make(~width="14rem", ~height="14rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("md"),
      ),
      Style.make(~width="17rem", ~height="17rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("lg"),
      ),
    }->stylesCombiner,
  }
})

@react.component
let make = (~src) => {
  let classes = useStyles(.)

  <Avatar src className={classes["photo"]} />
}
