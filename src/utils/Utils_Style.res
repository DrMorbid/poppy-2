let addMediaQuery = (
  ~addMediaPrefix=false,
  ~mediaQuery: string,
  style: ReactDOM.Style.t,
): ReactDOM.Style.t => {
  list{((addMediaPrefix ? "@media " : "") ++ mediaQuery, style)}->Js.Dict.fromList->Obj.magic
}

let styleWithMediaQuery = (
  ~addMediaPrefix=false,
  ~mediaQuery: string,
  style: ReactDOM.Style.t,
): ReactDOM.Style.t => style->addMediaQuery(~addMediaPrefix, ~mediaQuery)

let stylesCombiner = (listOfStyles: list<ReactDOM.Style.t>): ReactDOM.Style.t => {
  listOfStyles->Belt.List.reduce(ReactDOM.Style.make(), (acumulator, additionalStyle) =>
    ReactDOM.Style.combine(acumulator, additionalStyle)
  )
}
