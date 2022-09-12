module OpenInNew = {
  @react.component @module("@material-ui/icons/OpenInNew")
  external make: (~color: string=?, ~fontSize: string=?, ~className: string=?) => React.element =
    "default"
}

@react.component
let make = (~color=?, ~fontSize=?, ~className=?) => {
  <OpenInNew ?color ?fontSize ?className />
}
