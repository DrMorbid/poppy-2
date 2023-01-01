open News_Message

@react.component
let make = () => {
  let ({activeMenuItem, _}: App_Context.state, dispatch) = React.useContext(App_Context.Context.t)

  React.useEffect1(() => {
    if activeMenuItem != News {
      dispatch(App_Context.StoreActiveMenuItem(News))
    }

    None
  }, [activeMenuItem])

  <Content />
}
