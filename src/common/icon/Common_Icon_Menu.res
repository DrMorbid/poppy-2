module Menu = {
  @react.component @module("@mui/icons-material/Menu")
  external make: (~color: string=?, ~fontSize: string=?, ~className: string=?) => React.element =
    "default"
}

@react.component
let make = (~color=?, ~fontSize=?, ~className=?) => {
  <Menu ?color ?fontSize ?className />
}
