module LoadingButton = {
  @module("@mui/lab") @react.component
  external make: (
    ~loading: bool=?,
    ~disabled: bool=?,
    ~variant: Mui.Button.variant=?,
    ~color: Mui.Button.color=?,
    ~loadingIndicator: Jsx.element=?,
    ~loadingPosition: [#start | #end | #center]=?,
    ~startIcon: Jsx.element=?,
    ~sx: Mui.Sx.props=?,
    ~children: Jsx.element,
  ) => Jsx.element = "LoadingButton"
}
