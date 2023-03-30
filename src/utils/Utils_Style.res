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
  listOfStyles->Belt.List.reduce(Style.make(), (acumulator, additionalStyle) =>
    Style.combine(acumulator, additionalStyle)
  )
}
