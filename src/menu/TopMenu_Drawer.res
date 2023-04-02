open ReactIntl
open ReactDOM
open TopMenu_Item

module Classes = {
  let list = Style.make(~width="50vw", ())->Emotion.styleToClass
}

@react.component
let make = (~drawerOpen, ~onClose) => {
  let intl = useIntl()
  let url = RescriptReactRouter.useUrl()
  let (
    {homeMenuItemTargets, registrationsMenuItemTargets, _}: App_Context.state,
    _,
  ) = React.useContext(App_Context.Context.t)

  <Mui.Drawer
    \"open"=drawerOpen
    transitionDuration={Common.Constants.drawerTransitionDuration->Mui.Drawer.TransitionDuration.int}
    anchor=#right
    onClose={_ => onClose()}>
    <Mui.List className=Classes.list>
      {url
      ->getMenuItems
      ->List.mapWithIndex((index, section) =>
        <Mui.ListItem
          button=true
          onClick={_ =>
            section->onClick(
              ~onDrawerClose=onClose,
              ~menuItemTargets=url->pickMenuItemTargets(
                ~homeMenuItemTargets,
                ~registrationsMenuItemTargets,
              ),
            )}
          key={`menu-item-${index->Int.toString}`}>
          <Mui.ListItemText
            primary={intl
            ->ReactIntl.Intl.formatMessage(section->App_Types.MenuItem.toLabel)
            ->React.string}
          />
        </Mui.ListItem>
      )
      ->List.toArray
      ->React.array}
    </Mui.List>
  </Mui.Drawer>
}
