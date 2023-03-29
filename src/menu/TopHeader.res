open Mui
open Message.Menu
open ReactIntl
open ReactDOM
open Webapi.Dom

module Container = TopHeader_Container

module Classes = {
  let logoContainer = Style.make(~width="26%", ())->Emotion.styleToClass
  let logo = Style.make(~height="10vw", ())->Emotion.styleToClass
}

@react.component
let make = () => {
  let intl = useIntl()

  let onEmailUs = e => {
    location->Location.setHref(`mailto:${Common.Constants.infoEmail}`)
    e->ReactEvent.Synthetic.preventDefault
  }

  let onLogoClick = _ => App_Page.goTo(Home)

  let onRegisterClick = _ => App_Page.goTo(Registrations)

  <Container>
    <Grid item=true>
      <Common.Button.WithIcon label=emailUs onClick=onEmailUs />
    </Grid>
    <Hidden smDown=true>
      <Grid item=true className=Classes.logoContainer>
        <ButtonBase onClick=onLogoClick className=Common.Style.fullWidth>
          <img src="/poppy-logo.png" className=Classes.logo />
        </ButtonBase>
      </Grid>
    </Hidden>
    <Grid item=true>
      <Button variant=#contained color=#primary onClick=onRegisterClick>
        {intl->Intl.formatMessage(registrations)->React.string}
      </Button>
    </Grid>
  </Container>
}
