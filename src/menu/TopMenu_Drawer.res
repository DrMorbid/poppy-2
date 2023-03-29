open Mui
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

  <Drawer
    \"open"=drawerOpen
    transitionDuration={Common.Constants.drawerTransitionDuration->Drawer.TransitionDuration.int}
    anchor=#right
    onClose={_ => onClose()}>
    <List className=Classes.list>
      {url
      ->getMenuItems
      ->Belt.List.mapWithIndex((index, section) =>
        <ListItem
          button=true
          onClick={_ =>
            section->onClick(
              ~onDrawerClose=onClose,
              ~menuItemTargets=url->pickMenuItemTargets(
                ~homeMenuItemTargets,
                ~registrationsMenuItemTargets,
              ),
            )}
          key={`menu-item-${index->Belt.Int.toString}`}>
          <ListItemText
            primary={intl->Intl.formatMessage(section->App_Types.MenuItem.toLabel)->React.string}
          />
        </ListItem>
      )
      ->Belt.List.toArray
      ->React.array}
    </List>
  </Drawer>
}
