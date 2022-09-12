open Mui
open ReactDOM
open Utils.Style

module Theme = App_Theme
module Context = App_Context
module Actions = App_Actions
module Page = App_Page
module Router = App_Router

let useStyles: Styles.useStyles<{
  "container": string,
}> = Styles.makeStylesWithTheme(theme =>
  {
    "container": list{
      Common.Style.headerGap->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("sm"),
      ),
      Style.make(~marginTop="1rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.down->Any.unsafeGetValue("sm"),
      ),
    }->stylesCombiner,
  }
)

@react.component
let make = () => {
  let classes = useStyles(.)

  <>
    <TopMenu />
    <Container className={classes["container"]}>
      <Router />
    </Container>
  </>
}
