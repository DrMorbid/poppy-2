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
  let commonClasses = Common.Style.useStyles(.)

  <Container className={classes["container"]}>
    <Grid container=true direction=#column className={commonClasses["paragraphGap"]}>
      <Grid item=true>
        <TopHeader />
      </Grid>
      <Grid item=true>
        <TopMenu />
      </Grid>
      // TODO will probably go away
      <Grid item=true>
        <News.Message />
      </Grid>
      <Grid item=true>
        <Router />
      </Grid>
    </Grid>
  </Container>
}
