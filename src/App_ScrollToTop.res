open Mui
open Scroll
open ReactDOM

let useStyles: Styles.useStyles<{
  "button": string,
}> = Styles.makeStylesWithTheme(theme =>
  {
    "button": Style.make(
      ~position="fixed",
      ~bottom=theme.spacing(2)->Belt.Int.toString->Js.String2.concat("px"),
      ~right=theme.spacing(2)->Belt.Int.toString->Js.String2.concat("px"),
      (),
    ),
  }
)

let onClick = (~topRef: option<React.ref<Js.Nullable.t<Dom.element>>>=?, ~behavior=?, _) =>
  topRef->Belt.Option.forEach(({current}) =>
    current
    ->Js.Nullable.toOption
    ->Belt.Option.forEach(scrollIntoView(_, makeScrollOptions(~behavior?, ())))
  )

@react.component
let make = (~children) => {
  let \"in" = useScrollTrigger(Options.make(~disableHysteresis=true, ~threshold=200, ()))
  let classes = useStyles(.)
  let ({topRef, _}: App_Context.state, _) = React.useContext(App_Context.Context.t)

  <Grow \"in">
    <ButtonBase onClick={onClick(~topRef?)} className={classes["button"]}> children </ButtonBase>
  </Grow>
}
