open Scroll

module Classes = {
  let button = Mui.Sx.obj({
    position: String("fixed"),
    bottom: Breakpoint({xs: String("1rem"), sm: String("1.5rem"), md: String("2rem")}),
    right: Breakpoint({xs: String("1rem"), sm: String("1.5rem"), md: String("2rem")}),
  })
}

let onClick = (~topRef: option<React.ref<Nullable.t<Dom.element>>>=?, ~behavior=?, _) =>
  topRef->Option.forEach(({current}) =>
    current->Nullable.toOption->Option.forEach(scrollIntoView(_, makeScrollOptions(~behavior?, ())))
  )

@react.component
let make = () => {
  let isSmUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.smUp)
  let isMdUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.mdUp)
  let in_ = useScrollTrigger({disableHysteresis: true, threshold: 200})
  let ({topRef, _}: App_Context.state, _) = React.useContext(App_Context.Context.t)

  <Mui.Grow in_>
    <Mui.Fab
      onClick={e => onClick(e, ~topRef?)}
      color=Primary
      size={switch (isSmUp, isMdUp) {
      | (false, false) => Small
      | (true, false) => Medium
      | (_, true) => Large
      }}
      sx=Classes.button>
      <Common.Icon.KeyboardArrowUp />
    </Mui.Fab>
  </Mui.Grow>
}
