open Mui
open App_Page

module Tab = TopMenu_Tab

@react.component
let make = () => {
  let isMdUp = Core.useTheme()->Core.Breakpoint.get(#md->#up)->Core.useMediaQuery
  let ({activeMenuItem, _}: App_Context.state, _) = React.useContext(App_Context.Context.t)

  <AppBar position=#sticky>
    <Toolbar variant=?{isMdUp ? Some(#dense) : None}>
      <Grid container=true>
        <Grid item=true>
          <Tabs
            value={switch activeMenuItem {
            | None => false->Any.make
            | Some(activeMenuItem) => activeMenuItem->Any.make
            }}>
            <Tab page=AboutUs />
            <Tab page=Registrations />
            <Tab page=References />
            <Tab page=Contact />
          </Tabs>
        </Grid>
      </Grid>
    </Toolbar>
  </AppBar>
}
