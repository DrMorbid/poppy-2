open Mui
open ReactIntl
open App_Page

@react.component
let make = (~drawerOpen, ~onClose) => {
  let intl = useIntl()

  <Drawer \"open"=drawerOpen onClose={_ => onClose()}>
    <List>
      {App_Page.menuItems()
      ->Belt.List.map(page =>
        <ListItem button=true onClick={_ => onClose()}>
          <ListItemText primary={intl->Intl.formatMessage(page->toLabel)->React.string} />
        </ListItem>
      )
      ->Belt.List.toArray
      ->React.array}
    </List>
  </Drawer>
}
