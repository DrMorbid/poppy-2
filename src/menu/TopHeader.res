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
  let (_, dispatch) = React.useContext(App_Context.Context.t)

  let onEmailUs = e => {
    location->Location.setHref(`mailto:${Common.Constants.infoEmail}`)
    e->ReactEvent.Synthetic.preventDefault
  }

  let onLogoClick = _ => Home->App_Actions.goToPage(~dispatch)

  let onRegisterClick = _ => Registrations->App_Actions.goToPage(~dispatch)

  <Container>
    <Grid item=true>
      <Common.Button.WithIcon label=emailUs onClick=onEmailUs />
    </Grid>
    <Hidden smDown=true>
      <Grid item=true className={classes["logoContainer"]}>
        <ButtonBase onClick=onLogoClick>
          <img src="/poppy_logo.jpg" className={classes["logo"]} />
        </ButtonBase>
      </Grid>
    </Hidden>
    <Grid item=true>
      <Button variant=#contained color=#secondary onClick=onRegisterClick>
        {intl->Intl.formatMessage(registrations)->React.string}
      </Button>
    </Grid>
  </Container>
}
