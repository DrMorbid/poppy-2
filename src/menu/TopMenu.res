open Mui
open ReactIntl

module Drawer = TopMenu_Drawer
module Item = TopMenu_Item

@react.component
let make = () => {
  let (drawerOpen, setDrawerOpen) = React.useState(() => false)
  let intl = useIntl()
  let url = RescriptReactRouter.useUrl()

  let onAppNameClick = _ => App_Router.goTo(Home)

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
          {url->App_Router.isHomePage
            ? <Grid item=true>
                <IconButton onClick={_ => setDrawerOpen(_ => true)}>
                  <Common.Icon.Menu />
                </IconButton>
              </Grid>
            : React.null}
        </Grid>
      </Toolbar>
    </Hidden>
  </AppBar>
}
