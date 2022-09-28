module Close = {
  @react.component @module("@material-ui/icons/Close")
  external make: (~color: string=?, ~fontSize: string=?, ~className: string=?) => React.element =
    "default"
}

@react.component
let make = (~color=?, ~fontSize=?, ~className=?) => {
  <Close ?color ?fontSize ?className />
}
