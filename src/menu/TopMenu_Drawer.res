open Mui
open ReactIntl
open ReactDOM
open TopMenu_Item

let useStyles: Styles.useStyles<{
  "list": string,
}> = Styles.makeStyles({
  "list": Style.make(~width="50vw", ()),
})

@react.component
let make = (~drawerOpen, ~onClose) => {
  let intl = useIntl()
  let classes = useStyles(.)
  let url = RescriptReactRouter.useUrl()
  let ({menuItemTargets, _}: App_Context.state, _) = React.useContext(App_Context.Context.t)

  <Drawer
    \"open"=drawerOpen
    transitionDuration={Common.Constants.drawerTransitionDuration->Drawer.TransitionDuration.int}
    anchor=#right
    onClose={_ => onClose()}>
    <List className={classes["list"]}>
      {url
      ->getMenuItems
      ->Belt.List.mapWithIndex((index, section) =>
        <ListItem
          button=true
          onClick={_ => section->onClick(~onDrawerClose=onClose, ~menuItemTargets)}
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
