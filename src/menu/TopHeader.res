open Mui
open Message.Menu
open ReactIntl
open ReactDOM
open Webapi.Dom

module Container = TopHeader_Container

let useStyles: Styles.useStyles<{
  "logoContainer": string,
  "logo": string,
}> = Styles.makeStyles({
  "logoContainer": Style.make(~width="26%", ()),
  "logo": Style.make(~height="10vw", ()),
})

@react.component
let make = () => {
  let intl = useIntl()
  let classes = useStyles(.)
  let commonClasses = Common.Style.useStyles(.)

  let onEmailUs = e => {
    location->Location.setHref(`mailto:${Common.Constants.infoEmail}`)
    e->ReactEvent.Synthetic.preventDefault
  }

  let onLogoClick = _ => App_Router.goTo(Home)

  let onRegisterClick = _ => App_Router.goTo(Registrations)

  <Container>
    <Grid item=true>
      <Common.Button.WithIcon label=emailUs onClick=onEmailUs />
    </Grid>
    <Hidden smDown=true>
      <Grid item=true className={classes["logoContainer"]}>
        <ButtonBase onClick=onLogoClick className={commonClasses["fullWidth"]}>
          <img src="/poppy-logo.png" className={classes["logo"]} />
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
