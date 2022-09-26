open Mui
open ReactIntl
open App_Page
open ReactDOM

let useStyles: Styles.useStyles<{
  "list": string,
}> = Styles.makeStyles({
  "list": Style.make(~width="50vw", ()),
})

@react.component
let make = (~drawerOpen, ~onClose, ~isLatestNewsRead) => {
  let intl = useIntl()
  let classes = useStyles(.)
  let (_, dispatch) = React.useContext(App_Context.Context.t)

  <Drawer \"open"=drawerOpen onClose={_ => onClose()}>
    <List className={classes["list"]}>
      {App_Page.menuItems(isLatestNewsRead)
      ->Belt.List.map(page =>
        <ListItem
          button=true
          onClick={_ => {
            onClose()
            page->App_Actions.goToPage(~dispatch)
          }}>
          <ListItemText primary={intl->Intl.formatMessage(page->toLabel)->React.string} />
        </ListItem>
      )
      ->Belt.List.toArray
      ->React.array}
    </List>
  </Drawer>
}
