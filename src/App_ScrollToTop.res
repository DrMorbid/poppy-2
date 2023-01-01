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
let make = (~children) => {
  let \"in" = useScrollTrigger(Options.make(~disableHysteresis=true, ~threshold=200, ()))
  let classes = useStyles(.)

  let onClick = _ => {
    let anchor = querySelector("#back-to-top-anchor")
    anchor->Belt.Option.forEach(anchor =>
      anchor->scrollIntoView({behavior: #smooth, block: #center, inline: #nearest})
    )
  }

  <Zoom \"in">
    <ButtonBase onClick className={classes["button"]}> children </ButtonBase>
  </Zoom>
}
