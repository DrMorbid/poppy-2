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

  <Drawer \"open"=drawerOpen onClose={_ => onClose()}>
    <List className={classes["list"]}>
      {menuItems(isLatestNewsRead)
      ->Belt.List.map(section =>
        <ListItem button=true onClick={_ => section->onClick(~onSuccess=onClose)}>
          <ListItemText primary={intl->Intl.formatMessage(section->toLabel)->React.string} />
        </ListItem>
      )
      ->Belt.List.toArray
      ->React.array}
    </List>
  </Drawer>
}
