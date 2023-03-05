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

@react.component
let make = (~children, ~backToTopRef: React.ref<Js.Nullable.t<Dom.element>>) => {
  let \"in" = useScrollTrigger(Options.make(~disableHysteresis=true, ~threshold=200, ()))
  let classes = useStyles(.)

  let onClick = _ =>
    backToTopRef.current
    ->Js.Nullable.toOption
    ->Belt.Option.forEach(backToTopRef => backToTopRef->scrollIntoView(makeScrollOptions()))

  <Zoom \"in">
    <ButtonBase onClick className={classes["button"]}> children </ButtonBase>
  </Zoom>
}
