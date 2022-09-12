open Message.Registrations

@react.component
let make = () => {
  let ({activeMenuItem, _}: App_Context.state, dispatch) = React.useContext(App_Context.Context.t)

  React.useEffect1(() => {
    if activeMenuItem != Registrations {
      dispatch(App_Context.StoreActiveMenuItem(Registrations))
    }

    None
  }, [activeMenuItem])

  <Common.Text header paragraphs=list{paragraph1, paragraph2, paragraph3, paragraph4} />
}
