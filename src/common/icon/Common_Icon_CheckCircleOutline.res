module CheckCircleOutline = {
  @react.component @module("@mui/icons-material/CheckCircleOutline")
  external make: (~color: string=?, ~fontSize: string=?, ~className: string=?) => React.element =
    "default"
}

@react.component
let make = (~color=?, ~fontSize=?, ~className=?) => {
  <CheckCircleOutline ?color ?fontSize ?className />
}
