open Mui
open ReactIntl
open TopMenu_Item
open ReactDOM

module Classes = {
  let label = (theme: Theme.t) => {
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
  let theme = Core.useTheme()

  <Toolbar>
    <Grid container=true justify=#"space-evenly">
      {url
      ->getMenuItems
      ->Belt.List.mapWithIndex((index, menuItem) =>
        <Grid item=true key={`menu-item-${index->Belt.Int.toString}`}>
          <Button
            size=#large
            onClick={_ =>
              menuItem->onClick(
                ~menuItemTargets=url->pickMenuItemTargets(
                  ~homeMenuItemTargets,
                  ~registrationsMenuItemTargets,
                ),
              )}
            classes={Button.Classes.make(~label=theme->Classes.label, ())}>
            {intl->Intl.formatMessage(menuItem->App_Types.MenuItem.toLabel)->React.string}
          </Button>
        </Grid>
      )
      ->Belt.List.toArray
      ->React.array}
    </Grid>
  </Toolbar>
}
