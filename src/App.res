@@directive("'use client';")

open ReactDOM

module Theme = App_Theme
module Context = App_Context
module ScrollToTop = App_ScrollToTop
module ScrollableSection = App_ScrollableSection
module ScrollableSections = App_ScrollableSections
module Types = App_Types

@react.component
let make = (~children) => {
  let _prefersDarkMode = Mui.Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)
  let topRef = React.useRef(Nullable.null)
  let (_, dispatch) = React.useContext(App_Context.Context.t)
  let ({alert, _}: App_Context.state, _) = React.useContext(App_Context.Context.t)

  React.useEffect(() => {
    dispatch(SetTopRef(topRef))

    None
  }, [topRef])

  React.useEffect(() => {
    EnvVar.Email.apiKey->Option.forEach(EmailUs.Utils.authenticate)

    None
  }, [EnvVar.Email.apiKey])

  <Mui.Container maxWidth=Xl ref={topRef->Ref.domRef} sx=Common.Style.appContainer>
    <Mui.Grid container=true direction=Column sx={Common.Style.paragraphGap->Utils.Style.styleToSx}>
      <Mui.Grid item=true>
        <TopHeader />
      </Mui.Grid>
      <Mui.Grid item=true>
        <TopMenu />
      </Mui.Grid>
      <Mui.Grid item=true>
        <Common.Alert open_={alert->Option.isSome}> {alert} </Common.Alert>
        {children}
      </Mui.Grid>
    </Mui.Grid>
    <Mui.Snackbar />
    <ScrollToTop />
  </Mui.Container>
}
