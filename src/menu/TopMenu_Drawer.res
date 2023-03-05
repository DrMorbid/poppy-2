open Mui
open ReactIntl
open ReactDOM
open TopMenu_Item
open Home.Section

let useStyles: Styles.useStyles<{
  "list": string,
}> = Styles.makeStyles({
  "list": Style.make(~width="50vw", ()),
})

@react.component
let make = (~drawerOpen, ~onClose, ~isLatestNewsRead) => {
  let intl = useIntl()
  let classes = useStyles(.)
  let ({menutItemTopRefs: refsMap, _}: App_Context.state, _) = React.useContext(
    App_Context.Context.t,
  )

  <Drawer
    \"open"=drawerOpen
    transitionDuration={Common.Constants.drawerTransitionDuration->Drawer.TransitionDuration.int}
    onClose={_ => onClose()}>
    <List className={classes["list"]}>
      {menuItems(isLatestNewsRead)
      ->Belt.List.map(section =>
        <ListItem button=true onClick={_ => section->onClick(~onDrawerClose=onClose, ~refsMap)}>
          <ListItemText primary={intl->Intl.formatMessage(section->toLabel)->React.string} />
        </ListItem>
      )
      ->Belt.List.toArray
      ->React.array}
    </List>
  </Drawer>
}
