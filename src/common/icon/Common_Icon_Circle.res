module Circle = {
  @react.component @module("@mui/icons-material/Circle")
  external make: (~color: string=?, ~fontSize: string=?, ~className: string=?) => React.element =
    "default"
}

@react.component
let make = (~color=?, ~fontSize=?, ~className=?) => {
  <Circle ?color ?fontSize ?className />
}
