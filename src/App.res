open Mui
open ReactIntl

module Theme = App_Theme

@react.component
let make = () => {
  let intl = useIntl()
  let isMdUp = Core.useTheme()->Core.Breakpoint.get(#md->#up)->Core.useMediaQuery

  <AppBar position=#sticky>
    <Toolbar variant=?{isMdUp ? Some(#dense) : None}>
      <Grid container=true>
        <Grid item=true>
          <Tabs>
            <Tab label={intl->Intl.formatMessage(Message.Menu.aboutUs)->React.string} />
          </Tabs>
        </Grid>
      </Grid>
    </Toolbar>
  </AppBar>
}
