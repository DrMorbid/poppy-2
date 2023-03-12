module ExpandMore = {
  @react.component @module("@material-ui/icons/ExpandMore")
  external make: (~color: string=?, ~fontSize: string=?, ~className: string=?) => React.element =
    "default"
}

@react.component
let make = (~color=?, ~fontSize=?, ~className=?) => {
  <ExpandMore ?color ?fontSize ?className />
}
