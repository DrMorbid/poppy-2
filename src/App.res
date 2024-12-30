@@directive("'use client';")

open ReactDOM

module Theme = App_Theme
module Context = App_Context
module ScrollToTop = App_ScrollToTop
module ScrollableSection = App_ScrollableSection
module ScrollableSections = App_ScrollableSections
module Types = App_Types

module Classes = {
  let container = Mui.Sx.array([
    Mui.Sx.Array.obj({
      paddingTop: Breakpoint({xs: String("1rem"), sm: String("1.5rem"), md: String("2rem")}),
      paddingLeft: Breakpoint({xs: String("0rem"), sm: String("1.5rem"), md: String("2rem")}),
      paddingRight: Breakpoint({xs: String("0rem"), sm: String("1.5rem"), md: String("2rem")}),
    }),
    Mui.Sx.Array.func(theme =>
      Mui.Sx.Array.obj({
        bgcolor: theme.palette.mode->Theme.Colors.isLightMode
          ? String("rgba(250, 250, 250, 0.8)")
          : String("rgba(48, 48, 48, 0.8)"),
      })
    ),
  ])
}

@react.component
let make = (~children) => {
  let _prefersDarkMode = Mui.Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)
  let topRef = React.useRef(Nullable.null)
  let (_, dispatch) = React.useContext(App_Context.Context.t)

  React.useEffect(() => {
    dispatch(SetTopRef(topRef))

    None
  }, [topRef])

  React.useEffect(() => {
    EnvVar.Email.apiKey->Option.forEach(EmailUs.Utils.authenticate)

    None
  }, [EnvVar.Email.apiKey])

  <Mui.Container maxWidth=Xl ref={topRef->Ref.domRef} sx=Classes.container>
    <Mui.Grid container=true direction=Column sx={Common.Style.paragraphGap->Utils.Style.styleToSx}>
      <Mui.Grid item=true>
        <TopHeader />
      </Mui.Grid>
      <Mui.Grid item=true>
        <TopMenu />
      </Mui.Grid>
      <Mui.Grid item=true> {children} </Mui.Grid>
    </Mui.Grid>
    <Mui.Snackbar />
    <ScrollToTop />
  </Mui.Container>
}
