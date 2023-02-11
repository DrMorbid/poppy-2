open Mui
open ReactIntl
open TopMenu_Item
open Home.Section

@react.component
let make = (~isLatestNewsRead) => {
  let intl = useIntl()
  let ({activeMenuItem, _}: App_Context.state, _dispatch) = React.useContext(App_Context.Context.t)

  // TODO: This is wrong, we need to use the section we clicked
  <Tabs value={activeMenuItem->Any.make} variant=#fullWidth>
    {menuItems(isLatestNewsRead)
    ->Belt.List.map(section =>
      <Tab
        label={intl->Intl.formatMessage(section->toLabel)->React.string}
        value={section->Any.make}
        onClick={_ => section->onClick}
      />
    )
    ->Belt.List.toArray
    ->React.array}
  </Tabs>
}
