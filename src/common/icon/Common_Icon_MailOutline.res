module MailOutline = {
  @react.component @module("@mui/icons-material/MailOutline")
  external make: (~color: string=?, ~fontSize: string=?, ~className: string=?) => React.element =
    "default"
}

@react.component
let make = (~color=?, ~fontSize=?, ~className=?) => {
  <MailOutline ?color ?fontSize ?className />
}
