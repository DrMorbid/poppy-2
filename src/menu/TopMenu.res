open Mui
open ReactIntl
open Promise

module Drawer = TopMenu_Drawer
module Tabs = TopMenu_Tabs

@react.component
let make = () => {
  let (isLatestNewsRead, setIsLatestNewsRead) = React.useState(() => false)
  let (drawerOpen, setDrawerOpen) = React.useState(() => false)
  let intl = useIntl()
  let ({activeMenuItem, latestNewsClosed}: App_Context.state, _) = React.useContext(
    App_Context.Context.t,
  )

  React.useEffect1(() => {
    News.Idb.isLatestNewsRead()
    ->thenResolve(isLatestNewsRead => setIsLatestNewsRead(_ => isLatestNewsRead))
    ->ignore

    None
  }, [latestNewsClosed])

  <AppBar position=#sticky>
    <Drawer drawerOpen onClose={() => setDrawerOpen(_ => false)} isLatestNewsRead />
    <Hidden xsDown=true>
      <Tabs isLatestNewsRead />
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
