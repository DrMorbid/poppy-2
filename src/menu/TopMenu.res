open Mui
open ReactIntl

module Drawer = TopMenu_Drawer
module Item = TopMenu_Item

@react.component
let make = () => {
  let (drawerOpen, setDrawerOpen) = React.useState(() => false)
  let intl = useIntl()
  let url = RescriptReactRouter.useUrl()

  let onAppNameClick = _ => App_Page.goTo(Home)

  <AppBar position=#static color=#default>
    <Drawer drawerOpen onClose={() => setDrawerOpen(_ => false)} />
    <Hidden smDown=true>
      <TopMenu_Toolbar />
    </Hidden>
    <Hidden mdUp=true>
      <Toolbar>
        {if url->App_Page.isHomePage {
          <Grid container=true justify=#"space-between" alignItems=#center>
            {<>
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
            </>}
          </Grid>
        } else {
          <Grid container=true justify=#center>
            <Button variant=#outlined size=#large onClick=onAppNameClick>
              {intl->Intl.formatMessage(Home->App_Page.toLabel)->React.string}
            </Button>
          </Grid>
        }}
      </Toolbar>
    </Hidden>
  </AppBar>
}
