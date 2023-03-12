open Mui
open ReactIntl

module Drawer = TopMenu_Drawer
module Item = TopMenu_Item

@react.component
let make = () => {
  let (drawerOpen, setDrawerOpen) = React.useState(() => false)
  let intl = useIntl()

  let onAppNameClick = _ => Home->App_Actions.goToPage

  <AppBar position=#static color=#default>
    <Drawer drawerOpen onClose={() => setDrawerOpen(_ => false)} />
    <Hidden smDown=true>
      <TopMenu_Toolbar />
    </Hidden>
    <Hidden mdUp=true>
      <Toolbar>
        <Grid container=true justify=#"space-between" alignItems=#center>
          <Grid item=true>
            <ButtonBase onClick=onAppNameClick>
              <Typography variant=#h4>
                {intl->Intl.formatMessage(Message.appName)->React.string}
              </Typography>
            </ButtonBase>
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
