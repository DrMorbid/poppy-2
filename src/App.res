open Mui
open ReactDOM
open Utils.Style
open Emotion

module Theme = App_Theme
module Context = App_Context
module Actions = App_Actions
module Page = App_Page
module Router = App_Router
module ScrollToTop = App_ScrollToTop
module ScrollableSection = App_ScrollableSection
module ScrollableSections = App_ScrollableSections

module Classes = {
  let container = (theme: Mui.Theme.t) =>
    list{
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
    }
    ->stylesCombiner
    ->styleToClass
  let containerColorLight =
    Style.make(~backgroundColor="rgba(250, 250, 250, 0.75)", ())->styleToClass
  let containerColorDark = Style.make(~backgroundColor="rgba(48, 48, 48, 0.75)", ())->styleToClass
}

@react.component
let make = () => {
  let theme = Core.useTheme()
  let isSmUp = Core.useMediaQuery(theme->Core.Breakpoint.get(#sm->#up))
  let isMdUp = Core.useMediaQuery(theme->Core.Breakpoint.get(#md->#up))
  let prefersDarkMode = Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)
  let topRef = React.useRef(Nullable.null)
  let (_, dispatch) = React.useContext(App_Context.Context.t)

  React.useEffect1(() => {
    dispatch(SetTopRef(topRef))

    None
  }, [topRef])

  <Container
    maxWidth=Container.MaxWidth.xl
    classes={Container.Classes.make(~root=Classes.container(theme), ())}
    className={prefersDarkMode ? Classes.containerColorDark : Classes.containerColorLight}
    ref={topRef->Ref.domRef}>
    <Grid container=true direction=#column className=Common.Style.paragraphGap>
      <Grid item=true>
        <TopHeader />
      </Grid>
      <Grid item=true>
        <TopMenu />
      </Grid>
      <Grid item=true>
        <Router />
      </Grid>
    </Grid>
    <Snackbar />
    <ScrollToTop>
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
