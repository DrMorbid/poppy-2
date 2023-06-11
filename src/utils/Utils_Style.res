open ReactDOM

let addMediaQuery = (~addMediaPrefix=false, ~mediaQuery: string, style: Style.t): Style.t => {
  list{((addMediaPrefix ? "@media " : "") ++ mediaQuery, style)}
  ->List.toArray
  ->Dict.fromArray
  ->Obj.magic
}

let styleWithMediaQuery = (~addMediaPrefix=false, ~mediaQuery: string, style: Style.t): Style.t =>
  style->addMediaQuery(~addMediaPrefix, ~mediaQuery)

let stylesCombiner = (listOfStyles: list<Style.t>): Style.t => {
  listOfStyles->List.reduce(Style.make(), (acumulator, additionalStyle) =>
    Style.combine(acumulator, additionalStyle)
  )
}

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
    ->Option.map(transparency => color->App_Theme.Transparency.addTransparency(transparency))
    ->Option.getWithDefault(color) ++
    " " ++
    percentage
    ->Option.map(Int.toString)
    ->Option.map(percentage => percentage ++ "%")
    ->Option.getWithDefault("")

  "color-mix(in srgb, " ++
  color->tweakColor(~transparency=?transparency1, ~percentage=?percentage1) ++
  ", " ++
  with->tweakColor(~transparency=?transparency2, ~percentage=?percentage2) ++ ")"
}
