open Message.Menu
open ReactIntl
open ReactDOM

module Container = TopHeader_Container

module Classes = {
  let logoContainer = Mui.Sx.obj({width: String("26%")})
  let logo = Style.make(~height="10vw", ())
}

@react.component
let make = () => {
  let intl = useIntl()
  let prefersDarkMode = Mui.Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)
  let router = Next.Navigation.useRouter()
  let isMdUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.mdUp)

  let onEmailUs = () => router->App_Page.goTo(EmailUs)

  let onLogoClick = _ => router->App_Page.goTo(Home)

  let onRegisterClick = _ => router->App_Page.goTo(Registrations)

  <Container>
    <Mui.Grid item=true>
      <Common.Button.WithIcon
        label=emailUs large=?{isMdUp ? Some(true) : None} onClick={_ => onEmailUs()->ignore}
      />
    </Mui.Grid>
    <Mui.Hidden mdDown=true>
      <Mui.Grid item=true sx=Classes.logoContainer>
        <Mui.ButtonBase onClick=onLogoClick sx=Common.Style.fullWidth>
          <img
            src={prefersDarkMode ? "/poppy-logo-dark.png" : "/poppy-logo-light.png"}
            style=Classes.logo
          />
        </Mui.ButtonBase>
      </Mui.Grid>
    </Mui.Hidden>
    <Mui.Grid item=true>
      <Mui.Button
        size=?{isMdUp ? Some(Large) : None}
        variant=Contained
        color=Primary
        onClick=onRegisterClick
        sx=?{isMdUp ? Some(Common.Style.largeButtonLabel) : None}>
        {intl->ReactIntl.Intl.formatMessage(registrations)->React.string}
      </Mui.Button>
    </Mui.Grid>
  </Container>
}
