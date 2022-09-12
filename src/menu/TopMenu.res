open Mui
open ReactIntl

module Drawer = TopMenu_Drawer
module Tabs = TopMenu_Tabs

@react.component
let make = () => {
  let (drawerOpen, setDrawerOpen) = React.useState(() => false)
  let intl = useIntl()
  let ({activeMenuItem, _}: App_Context.state, _) = React.useContext(App_Context.Context.t)

  <AppBar position=#sticky>
    <Drawer drawerOpen onClose={() => setDrawerOpen(_ => false)} />
    <Hidden xsDown=true>
      <Tabs />
    </Hidden>
    <Hidden smUp=true>
      <Toolbar>
        <Grid container=true justify=#"space-between" alignItems=#center>
          <Grid item=true>
            <Typography variant=#h5>
              {intl->Intl.formatMessage(activeMenuItem->App_Page.toLabel)->React.string}
            </Typography>
          </Grid>
          <Grid item=true>
            <IconButton onClick={_ => setDrawerOpen(_ => true)}>
              <Common.Icon.Menu />
            </IconButton>
          </Grid>
        </Grid>
      </Toolbar>
    </Hidden>
  </AppBar>
}
