open Mui
open ReactIntl
open Promise

module Drawer = TopMenu_Drawer
module Item = TopMenu_Item
module Tabs = TopMenu_Tabs

@react.component
let make = () => {
  let (isLatestNewsRead, setIsLatestNewsRead) = React.useState(() => false)
  let (drawerOpen, setDrawerOpen) = React.useState(() => false)
  let intl = useIntl()
  let ({latestNewsClosed, _}: App_Context.state, dispatch) = React.useContext(App_Context.Context.t)

  React.useEffect1(() => {
    News.Idb.isLatestNewsRead()
    ->thenResolve(isLatestNewsRead => setIsLatestNewsRead(_ => isLatestNewsRead))
    ->ignore

    None
  }, [latestNewsClosed])

  let onAppNameClick = _ => Home->App_Actions.goToPage(~dispatch)

  <AppBar position=#static>
    <Drawer drawerOpen onClose={() => setDrawerOpen(_ => false)} isLatestNewsRead />
    <Hidden smDown=true>
      <Tabs isLatestNewsRead />
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
