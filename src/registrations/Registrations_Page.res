open Message.Registrations
open Mui

@react.component
let make = () => {
  let ({activeMenuItem, _}: App_Context.state, dispatch) = React.useContext(App_Context.Context.t)
  let isSmUp = Core.useMediaQuery(Core.useTheme()->Core.Breakpoint.get(#sm->#up))

  React.useEffect1(() => {
    if activeMenuItem != Registrations {
      dispatch(App_Context.StoreActiveMenuItem(Registrations))
    }

    None
  }, [activeMenuItem])

  <Common.Text
    header=?{isSmUp ? Some(header) : None}
    paragraphs=list{paragraph1, paragraph2, paragraph3, paragraph4}
  />
}
