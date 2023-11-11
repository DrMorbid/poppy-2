// TODO: Deprecated, get rid of this
@module("@mui/material/styles")
external useTheme: unit => Mui.Theme.t = "useTheme"

// TODO: Deprecated, get rid of this
module StylesProvider = {
  @react.component @module("@mui/styles")
  external make: (
    ~children: Jsx.element,
    ~disableGeneration: bool=?,
    ~injectFirst: bool=?,
    ~jss: {..}=?,
  ) => React.element = "StylesProvider"
}
