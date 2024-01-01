module Drawer = TopMenu_Drawer
module Item = TopMenu_Item

@react.component
let make = () => {
  let (drawerOpen, setDrawerOpen) = React.useState(() => false)
  let intl = ReactIntl.useIntl()
  let pathname = Next.Navigation.usePathname()
  let router = Next.Navigation.useRouter()

  let onAppNameClick = _ => router->App_Page.goTo(Home)

  <Mui.AppBar position=Static>
    <Drawer drawerOpen onClose={() => setDrawerOpen(_ => false)} />
    <Mui.Hidden mdDown=true>
      <TopMenu_Toolbar />
    </Mui.Hidden>
    <Mui.Hidden mdUp=true>
      <Mui.Toolbar>
        {if pathname->App_Page.isHomePage || pathname->App_Page.isRegistrationsPage {
          <Mui.Grid container=true justifyContent=String("space-between") alignItems=Center>
            {<>
              <Mui.Grid item=true>
                <Mui.ButtonBase onClick=onAppNameClick>
                  <Mui.Typography variant=H4>
                    {intl->ReactIntl.Intl.formatMessage(Message.appName)->React.string}
                  </Mui.Typography>
                </Mui.ButtonBase>
              </Mui.Grid>
              <Mui.Grid item=true>
                <Mui.IconButton onClick={_ => setDrawerOpen(_ => true)}>
                  <Common.Icon.Menu />
                </Mui.IconButton>
              </Mui.Grid>
            </>}
          </Mui.Grid>
        } else {
          <Mui.Grid container=true justifyContent=Center>
            <Mui.Button variant=Outlined size=Large color=Secondary onClick=onAppNameClick>
              {intl->ReactIntl.Intl.formatMessage(Home->App_Page.toLabel)->React.string}
            </Mui.Button>
          </Mui.Grid>
        }}
      </Mui.Toolbar>
    </Mui.Hidden>
  </Mui.AppBar>
}
