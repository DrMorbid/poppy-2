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
  "logoContainer": Style.make(~width="25%", ()),
  "logo": Style.make(~height="11vw", ()),
})

@react.component
let make = () => {
  let intl = useIntl()
  let classes = useStyles(.)

  let onEmailUs = e => {
    location->Location.setHref(`mailto:${Common.Constants.infoEmail}`)
    e->ReactEvent.Synthetic.preventDefault
  }

  <Container>
    <Grid item=true>
      <Common.Button.WithIcon label=emailUs onClick=onEmailUs />
    </Grid>
    <Hidden smDown=true>
      <Grid item=true className={classes["logoContainer"]}>
        <Card>
          <CardMedia className={classes["logo"]} image="/poppy_logo.jpg" />
        </Card>
      </Grid>
    </Hidden>
    <Grid item=true>
      <Button variant=#contained color=#secondary>
        {intl->Intl.formatMessage(register)->React.string}
      </Button>
    </Grid>
  </Container>
}
