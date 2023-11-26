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
module Types = App_Types

module Classes = {
  let container =
    list{
      Style.make(
        ~paddingTop="1rem",
        ~paddingLeft="0rem",
        ~paddingRight="0rem",
        (),
      )->styleWithMediaQuery(~addMediaPrefix=true, ~mediaQuery=Theme.Breakpoint.xsUp),
      Style.make(
        ~paddingTop="1.5rem",
        ~paddingLeft="1.5rem",
        ~paddingRight="1.5rem",
        (),
      )->styleWithMediaQuery(~addMediaPrefix=true, ~mediaQuery=Theme.Breakpoint.smUp),
      Style.make(
        ~paddingTop="2rem",
        ~paddingLeft="2rem",
        ~paddingRight="2rem",
        (),
      )->styleWithMediaQuery(~addMediaPrefix=true, ~mediaQuery=Theme.Breakpoint.mdUp),
    }
    ->stylesCombiner
    ->styleToClass
  let containerColorLight =
    Style.make(~backgroundColor="rgba(250, 250, 250, 0.8)", ())->styleToClass
  let containerColorDark = Style.make(~backgroundColor="rgba(48, 48, 48, 0.8)", ())->styleToClass
}

@react.component
let make = () => {
  let isSmUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.smUp)
  let isMdUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.mdUp)
  let prefersDarkMode = Mui.Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)
  let topRef = React.useRef(Nullable.null)
  let (_, dispatch) = React.useContext(App_Context.Context.t)

  React.useEffect(() => {
    dispatch(SetTopRef(topRef))

    None
  }, [topRef])

  <Mui.Container
    maxWidth=Xl
    classes={root: Classes.container}
    className={prefersDarkMode ? Classes.containerColorDark : Classes.containerColorLight}
    ref={topRef->Ref.domRef}>
    <Mui.Grid container=true direction=Column className=Common.Style.paragraphGap>
      <Mui.Grid item=true>
        <TopHeader />
      </Mui.Grid>
      <Mui.Grid item=true>
        <TopMenu />
      </Mui.Grid>
      <Mui.Grid item=true>
        <Router />
      </Mui.Grid>
    </Mui.Grid>
    <Mui.Snackbar />
    <ScrollToTop>
      <Mui.Fab
        color=Primary
        size={switch (isSmUp, isMdUp) {
        | (false, false) => Small
        | (true, false) => Medium
        | (_, true) => Large
        }}>
        <Common.Icon.KeyboardArrowUp />
      </Mui.Fab>
    </ScrollToTop>
  </Mui.Container>
}
