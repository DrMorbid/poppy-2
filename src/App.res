open Mui
open ReactDOM
open Utils.Style
open App_Types

module Theme = App_Theme
module Context = App_Context
module Actions = App_Actions
module Page = App_Page
module Router = App_Router
module ScrollToTop = App_ScrollToTop

let useStyles: Styles.useStyles<{
  "container": string,
  "containerColorLight": string,
  "containerColorDark": string,
}> = Styles.makeStylesWithTheme(theme => {
  {
    "container": list{
      Style.make(
        ~paddingTop="1rem",
        ~paddingLeft="0rem",
        ~paddingRight="0rem",
        (),
      )->styleWithMediaQuery(~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("xs")),
      Style.make(
        ~paddingTop="1.5rem",
        ~paddingLeft="1.5rem",
        ~paddingRight="1.5rem",
        (),
      )->styleWithMediaQuery(~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("sm")),
      Style.make(
        ~paddingTop="2rem",
        ~paddingLeft="2rem",
        ~paddingRight="2rem",
        (),
      )->styleWithMediaQuery(~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("md")),
    }->stylesCombiner,
    "containerColorLight": Style.make(~backgroundColor="rgba(250, 250, 250, 0.75)", ()),
    "containerColorDark": Style.make(~backgroundColor="rgba(48, 48, 48, 0.75)", ()),
  }
})

@react.component
let make = () => {
  let classes = useStyles(.)
  let commonClasses = Common.Style.useStyles(.)
  let isSmUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#sm->#up))
  let isMdUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#md->#up))
  let prefersDarkMode = Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)
  let topRef = React.useRef(Js.Nullable.null)
  let contactTopRef = React.useRef(Js.Nullable.null)
  let (_, dispatch) = React.useContext(Context.Context.t)

  React.useEffect1(() => {
    dispatch(Context.AddMenuItemTopRef(Contact, contactTopRef))

    None
  }, [contactTopRef])

  <Container
    maxWidth=Container.MaxWidth.xl
    classes={Container.Classes.make(~root=classes["container"], ())}
    className={prefersDarkMode ? classes["containerColorDark"] : classes["containerColorLight"]}
    ref={topRef->Ref.domRef}>
    <Grid container=true direction=#column className={commonClasses["paragraphGap"]}>
      <Grid item=true>
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
      <Grid item=true ref={contactTopRef->Ref.domRef}>
        <Contact.Content.Simple />
      </Grid>
    </Grid>
    <Snackbar />
    <ScrollToTop backToTopRef=topRef>
      <Fab
        color=#primary
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
