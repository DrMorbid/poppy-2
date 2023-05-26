open ReactIntl
open TopMenu_Item
open ReactDOM

module Classes = {
  let label = (theme: Mui.Theme.t) => {
    let tabTypography = theme.typography.h5
    Style.make(
      ~fontSize=?tabTypography.fontSize,
      ~fontWeight=?tabTypography.fontWeight,
      ~lineHeight=?tabTypography.lineHeight,
      (),
    )->Emotion.styleToClass
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
  let theme = Mui.Core.useTheme()

  <Mui.Toolbar disableGutters=true>
    <Mui.Grid container=true justify=#"space-evenly" spacing=#1>
      {url
      ->getMenuItems
      ->List.mapWithIndex((index, menuItem) =>
        <Mui.Grid item=true key={`menu-item-${index->Int.toString}`}>
          <Mui.Button
            size=#large
            color=#default
            variant=#outlined
            onClick={_ =>
              menuItem->onClick(
                ~menuItemTargets=url->pickMenuItemTargets(
                  ~homeMenuItemTargets,
                  ~registrationsMenuItemTargets,
                ),
              )}
            classes={Mui.Button.Classes.make(~label=theme->Classes.label, ())}>
            {intl->ReactIntl.Intl.formatMessage(menuItem->App_Types.MenuItem.toLabel)->React.string}
          </Mui.Button>
        </Mui.Grid>
      )
      ->List.toArray
      ->React.array}
    </Mui.Grid>
  </Mui.Toolbar>
}
