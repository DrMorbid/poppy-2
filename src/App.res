open Mui
open ReactDOM
open Utils.Style

module Theme = App_Theme
module Context = App_Context
module Actions = App_Actions
module Page = App_Page
module Router = App_Router
module ScrollToTop = App_ScrollToTop

let useStyles: Styles.useStyles<{
  "container": string,
}> = Styles.makeStylesWithTheme(theme =>
  {
    "container": list{
      Common.Style.headerGap->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("sm"),
      ),
      Style.make(~marginTop="1rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("xs"),
      ),
      Style.make(~paddingLeft="0", ~paddingRight="0", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.down->Any.unsafeGetValue("xs"),
      ),
    }->stylesCombiner,
  }
)

@react.component
let make = () => {
  let classes = useStyles(.)
  let commonClasses = Common.Style.useStyles(.)
  let isSmUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#sm->#up))
  let isMdUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#md->#up))

  <Container className={classes["container"]}>
    <Grid container=true direction=#column className={commonClasses["paragraphGap"]}>
      <Grid item=true id="back-to-top-anchor">
        <TopHeader />
      </Grid>
      <Grid item=true>
        <TopMenu />
      </Grid>
      <Grid item=true>
        <News.Message />
      </Grid>
      <Grid item=true>
        <Router />
      </Grid>
      <Grid item=true>
        <Contact.Content.Simple />
      </Grid>
    </Grid>
    <Snackbar />
    <ScrollToTop>
      <Fab
        color=#secondary
        size={switch (isSmUp, isMdUp) {
        | (false, false) => #small
        | (true, false) => #medium
        | (_, true) => #large
        }}>
        <Common.Icon.KeyboardArrowUp />
      </Fab>
    </ScrollToTop>
  </Container>
}
