open Mui
open Scroll
open ReactDOM
open Utils.Style

module Classes = {
  let button = (theme: Theme.t) =>
    list{
      Style.make(~position="fixed", ~bottom="1rem", ~right="1rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("xs"),
      ),
      Style.make(~position="fixed", ~bottom="1.5rem", ~right="1.5rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("sm"),
      ),
      Style.make(~position="fixed", ~bottom="2rem", ~right="2rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("md"),
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
  let \"in" = useScrollTrigger(Options.make(~disableHysteresis=true, ~threshold=200, ()))
  let ({topRef, _}: App_Context.state, _) = React.useContext(App_Context.Context.t)
  let theme = Core.useTheme()

  <Grow \"in">
    <ButtonBase onClick={onClick(~topRef?)} className={Classes.button(theme)}>
      children
    </ButtonBase>
  </Grow>
}
