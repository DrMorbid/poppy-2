open Mui
open Message.Menu
open ReactIntl
open ReactDOM

module Container = TopHeader_Container

module Classes = {
  let logoContainer = Style.make(~width="26%", ())->Emotion.styleToClass
  let logo = Style.make(~height="10vw", ())->Emotion.styleToClass
}

@react.component
let make = () => {
  let intl = useIntl()
  let prefersDarkMode = Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)

  // let onEmailUs = e => {
  //   location->Location.setHref(`mailto:${Common.Constants.infoEmail}`)
  //   e->ReactEvent.Synthetic.preventDefault
  // }

  let onEmailUs = async () => {
    // TODO: log
    Js.Console.log("Sending an email...")

    let message = await SmtpJs.email->SmtpJs.sendWithSecureToken({
      "SecureToken": "678157a9-d3e9-40c2-86d1-7a60817485de",
      "To": "drmorbid@seznam.cz",
      "From": "filip.kittnar@seznam.cz",
      "Subject": "This is a test email",
      "Body": "Well... Did it arrive?",
    })

    // TODO: log
    Js.Console.log2("Email sent: ", message)
  }

  let onLogoClick = _ => App_Page.goTo(Home)

  let onRegisterClick = _ => App_Page.goTo(Registrations)

  <Container>
    <Grid item=true>
      <Common.Button.WithIcon label=emailUs onClick={_ => onEmailUs()->ignore} />
    </Grid>
    <Hidden smDown=true>
      <Grid item=true className=Classes.logoContainer>
        <ButtonBase onClick=onLogoClick className=Common.Style.fullWidth>
          <img
            src={prefersDarkMode ? "/poppy-logo-dark.png" : "/poppy-logo-light.png"}
            className=Classes.logo
          />
        </ButtonBase>
      </Grid>
    </Hidden>
    <Grid item=true>
      <Button variant=#contained color=#primary onClick=onRegisterClick>
        {intl->ReactIntl.Intl.formatMessage(registrations)->React.string}
      </Button>
    </Grid>
  </Container>
}
