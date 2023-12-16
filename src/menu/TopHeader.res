open Message.Menu
open ReactIntl
open ReactDOM

module Container = TopHeader_Container

module Classes = {
  let logoContainer = Style.make(~width="26% !important", ())->Emotion.styleToClass
  let logo = Style.make(~height="10vw !important", ())->Emotion.styleToClass
}

@react.component
let make = () => {
  let intl = useIntl()
  let prefersDarkMode = Mui.Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)

  let onEmailUs = () => App_Page.goTo(EmailUs)

  let onLogoClick = _ => App_Page.goTo(Home)

  let onRegisterClick = _ => App_Page.goTo(Registrations)

  <Container>
    <Mui.Grid item=true>
      <Common.Button.WithIcon label=emailUs onClick={_ => onEmailUs()->ignore} />
    </Mui.Grid>
    <Mui.Hidden smDown=true>
      <Mui.Grid item=true className=Classes.logoContainer>
        <Mui.ButtonBase onClick=onLogoClick className=Common.Style.fullWidth>
          <img
            src={prefersDarkMode ? "/poppy-logo-dark.png" : "/poppy-logo-light.png"}
            className=Classes.logo
          />
        </Mui.ButtonBase>
      </Mui.Grid>
    </Mui.Hidden>
    <Mui.Grid item=true>
      <Mui.Button variant=Contained color=Primary onClick=onRegisterClick>
        {intl->ReactIntl.Intl.formatMessage(registrations)->React.string}
      </Mui.Button>
    </Mui.Grid>
  </Container>
}
