open ReactIntl

@react.component
let make = (~label, ~onClick, ~index, ~visible=false) => {
  let intl = useIntl()

  let pickColor = (): Mui.Button.color =>
    switch index->Int.mod(4) {
    | 0 => Primary
    | 1 => Error
    | 2 => Secondary
    | 3 => Success
    | _ => Info
    }

  <Mui.Grow in_=visible timeout={Duration(Common.Constants.menuItemAnimationDuration)}>
    <Mui.Button variant=Contained color={pickColor()} onClick sx={Common.Style.largeButtonLabel}>
      {intl->ReactIntl.Intl.formatMessage(label)->React.string}
    </Mui.Button>
  </Mui.Grow>
}
