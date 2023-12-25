module Close = {
  @react.component @module("@mui/icons-material/Close")
  external make: (~color: string=?, ~fontSize: string=?, ~className: string=?) => React.element =
    "default"
}

@react.component
let make = (~color=?, ~fontSize=?, ~className=?) => {
  <Close ?color ?fontSize ?className />
}
