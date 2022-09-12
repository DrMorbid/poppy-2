open Mui
open ReactIntl
open ReactDOM

let useStyles: Styles.useStyles<{
  "root": string,
}> = Styles.makeStyles({
  "root": Style.make(~textTransform="none", ()),
})

@react.component
let make = (~label, ~onClick) => {
  let intl = useIntl()
  let classes = useStyles(.)

  <Button
    variant=#outlined
    endIcon={<Common.Icon.OpenInNew />}
    onClick={_ => onClick()}
    classes={Button.Classes.make(~root=classes["root"], ())}>
    {intl->Intl.formatMessage(label)->React.string}
  </Button>
}
