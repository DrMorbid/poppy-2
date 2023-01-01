@react.component
let make = () => {
  let ({activeMenuItem, _}: App_Context.state, dispatch) = React.useContext(App_Context.Context.t)

  React.useEffect1(() => {
    if activeMenuItem != Contact {
      dispatch(App_Context.StoreActiveMenuItem(Contact))
    }

    None
  }, [activeMenuItem])

  <Contact_Content />
}
