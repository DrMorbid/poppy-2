open ReactIntl
open TopMenu_Item
open ReactDOM

module Classes = {
  let label = (_theme: Mui.Theme.t) => {
    // let tabTypography = theme.typography.h5
    Style.make()->Emotion.styleToClass
  }
}

@react.component
let make = () => {
  let intl = useIntl()
  let url = RescriptReactRouter.useUrl()
  let (
    {homeMenuItemTargets, registrationsMenuItemTargets, _}: App_Context.state,
    _,
  ) = React.useContext(App_Context.Context.t)
  let theme = MuiStyles.useTheme()

  <Mui.Toolbar disableGutters=true>
    <Mui.Grid container=true justifyContent=String("space-evenly") spacing=Int(1)>
      {url
      ->getMenuItems
      ->List.mapWithIndex((index, menuItem) =>
        <Mui.Grid item=true key={`menu-item-${index->Int.toString}`}>
          <Mui.Button
            size=Large
            variant=Outlined
            onClick={_ =>
              menuItem->onClick(
                ~menuItemTargets=url->pickMenuItemTargets(
                  ~homeMenuItemTargets,
                  ~registrationsMenuItemTargets,
                ),
              )}
            classes={text: theme->Classes.label}>
            {intl->ReactIntl.Intl.formatMessage(menuItem->App_Types.MenuItem.toLabel)->React.string}
          </Mui.Button>
        </Mui.Grid>
      )
      ->List.toArray
      ->React.array}
    </Mui.Grid>
  </Mui.Toolbar>
}
