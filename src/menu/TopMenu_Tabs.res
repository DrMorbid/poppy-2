open Mui
open ReactIntl
open App_Page

@react.component
let make = () => {
  let intl = useIntl()
  let ({activeMenuItem, _}: App_Context.state, dispatch) = React.useContext(App_Context.Context.t)

  <Tabs value={activeMenuItem->Any.make} variant=#fullWidth>
    {App_Page.menuItems()
    ->Belt.List.map(page =>
      <Tab
        label={intl->Intl.formatMessage(page->toLabel)->React.string}
        value={page->Any.make}
        onClick={_ => dispatch(App_Context.StoreActiveMenuItem(page))}
      />
    )
    ->Belt.List.toArray
    ->React.array}
  </Tabs>
}
