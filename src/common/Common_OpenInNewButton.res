open Mui
open ReactIntl
open ReactDOM
open Common_Icon

module Classes = {
  let root = Style.make(~textTransform="none", ())->Emotion.styleToClass
}

@react.component
let make = (~label, ~onClick) => {
  let intl = useIntl()

  <Button
    variant=#outlined
    endIcon={<OpenInNew />}
    onClick={_ => onClick()}
    classes={Button.Classes.make(~root=Classes.root, ())}>
    {intl->Intl.formatMessage(label)->React.string}
  </Button>
}
