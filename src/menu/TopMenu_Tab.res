open Mui
open ReactIntl
open App_Page

@react.component
let make = (~page: App_Page.t) => {
  let intl = useIntl()
  let (_, dispatch) = React.useContext(App_Context.Context.t)

  <Tab
    label={intl->Intl.formatMessage(page->toLabel)->React.string}
    value={page->Any.make}
    onClick={_ => dispatch(App_Context.StoreActiveMenuItem(Some(page)))}
  />
}
