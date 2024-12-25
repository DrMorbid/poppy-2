open ReactDOM

let mixColors = (
  ~transparency1=?,
  ~percentage1=?,
  ~transparency2=?,
  ~percentage2=?,
  ~with,
  color,
) => {
  let tweakColor = (~transparency=?, ~percentage=?, color) =>
    transparency
    ->Option.map(transparency => color->App_Theme_Transparency.addTransparency(transparency))
    ->Option.getOr(color) ++
    " " ++
    percentage
    ->Option.map(Int.toString(_))
    ->Option.map(percentage => percentage ++ "%")
    ->Option.getOr("")

  "color-mix(in srgb, " ++
  color->tweakColor(~transparency=?transparency1, ~percentage=?percentage1) ++
  ", " ++
  with->tweakColor(~transparency=?transparency2, ~percentage=?percentage2) ++ ")"
}

external styleToSx: Style.t => Mui.Sx.props = "%identity"
external styleToSxArray: Style.t => Mui.Sx.Array.t = "%identity"
external sxToStyle: Mui.Sx.props => Style.t = "%identity"
