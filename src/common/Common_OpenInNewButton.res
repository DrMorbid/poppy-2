open Mui
open ReactDOM
open Common_Icon

module Classes = {
  let root = Style.make(~textTransform="none !important", ())->Emotion.styleToClass
}

@react.component
let make = (~label, ~onClick) => {
  let intl = ReactIntl.useIntl()

  <Button
    variant=Outlined endIcon={<OpenInNew />} onClick={_ => onClick()} classes={root: Classes.root}>
    {intl->ReactIntl.Intl.formatMessage(label)->React.string}
  </Button>
}
