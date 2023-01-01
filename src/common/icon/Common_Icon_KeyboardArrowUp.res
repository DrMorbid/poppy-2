module KeyboardArrowUp = {
  @react.component @module("@material-ui/icons/KeyboardArrowUp")
  external make: (~color: string=?, ~fontSize: string=?, ~className: string=?) => React.element =
    "default"
}

@react.component
let make = (~color=?, ~fontSize=?, ~className=?) => {
  <KeyboardArrowUp ?color ?fontSize ?className />
}
