module OpenInNew = {
  @react.component @module("@mui/icons-material/OpenInNew")
  external make: (~color: string=?, ~fontSize: string=?, ~className: string=?) => React.element =
    "default"
}

@react.component
let make = (~color=?, ~fontSize=?, ~className=?) => {
  <OpenInNew ?color ?fontSize ?className />
}
