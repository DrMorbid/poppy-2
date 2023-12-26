open Scroll
open ReactDOM
open Utils.Style

module Classes = {
  let button =
    list{
      Style.make(
        ~position="fixed !important",
        ~bottom="1rem !important",
        ~right="1rem !important",
        (),
      )->styleWithMediaQuery(~addMediaPrefix=true, ~mediaQuery=App_Theme.Breakpoint.xsUp),
      Style.make(
        ~position="fixed !important",
        ~bottom="1.5rem !important",
        ~right="1.5rem !important",
        (),
      )->styleWithMediaQuery(~addMediaPrefix=true, ~mediaQuery=App_Theme.Breakpoint.smUp),
      Style.make(
        ~position="fixed !important",
        ~bottom="2rem !important",
        ~right="2rem !important",
        (),
      )->styleWithMediaQuery(~addMediaPrefix=true, ~mediaQuery=App_Theme.Breakpoint.mdUp),
    }
    ->stylesCombiner
    ->Emotion.styleToClass
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
      className=Classes.button>
      <Common.Icon.KeyboardArrowUp />
    </Mui.Fab>
  </Mui.Grow>
}
