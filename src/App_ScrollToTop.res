open Scroll
open ReactDOM
open Utils.Style

module Classes = {
  let button =
    list{
      Style.make(~position="fixed", ~bottom="1rem", ~right="1rem", ())->styleWithMediaQuery(
        ~addMediaPrefix=true,
        ~mediaQuery=App_Theme.Breakpoint.xsUp,
      ),
      Style.make(~position="fixed", ~bottom="1.5rem", ~right="1.5rem", ())->styleWithMediaQuery(
        ~addMediaPrefix=true,
        ~mediaQuery=App_Theme.Breakpoint.smUp,
      ),
      Style.make(~position="fixed", ~bottom="2rem", ~right="2rem", ())->styleWithMediaQuery(
        ~addMediaPrefix=true,
        ~mediaQuery=App_Theme.Breakpoint.mdUp,
      ),
    }
    ->stylesCombiner
    ->Emotion.styleToClass
}

let onClick = (~topRef: option<React.ref<Nullable.t<Dom.element>>>=?, ~behavior=?, _) =>
  topRef->Option.forEach(({current}) =>
    current->Nullable.toOption->Option.forEach(scrollIntoView(_, makeScrollOptions(~behavior?, ())))
  )

@react.component
let make = (~children) => {
  let in_ = useScrollTrigger(Options.make(~disableHysteresis=true, ~threshold=200, ()))
  let ({topRef, _}: App_Context.state, _) = React.useContext(App_Context.Context.t)

  <Mui.Grow in_>
    <Mui.ButtonBase onClick={e => onClick(e, ~topRef?)} className=Classes.button>
      children
    </Mui.ButtonBase>
  </Mui.Grow>
}
