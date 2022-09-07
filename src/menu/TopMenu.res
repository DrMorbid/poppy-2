open Mui

module Drawer = TopMenu_Drawer
module Tabs = TopMenu_Tabs

@react.component
let make = () => {
  let (drawerOpen, setDrawerOpen) = React.useState(() => false)

  <AppBar position=#sticky>
    <Drawer drawerOpen onClose={() => setDrawerOpen(_ => false)} />
    <Hidden xsDown=true>
      <Tabs />
    </Hidden>
    <Hidden smUp=true>
      <Toolbar>
        <Grid container=true justify=#"flex-end">
          <Grid item=true>
            <IconButton onClick={_ => setDrawerOpen(_ => true)}>
              <App_Icon.Menu />
            </IconButton>
          </Grid>
        </Grid>
      </Toolbar>
    </Hidden>
  </AppBar>
}
