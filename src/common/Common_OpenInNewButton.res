open Mui
open ReactDOM
open Common_Icon

module Classes = {
  let root: Style.t = {textTransform: "none"}
}

@react.component
let make = (~label, ~onClick) => {
  let intl = ReactIntl.useIntl()

  <Button variant=Outlined endIcon={<OpenInNew />} onClick={_ => onClick()} style={Classes.root}>
    {intl->ReactIntl.Intl.formatMessage(label)->React.string}
  </Button>
}
