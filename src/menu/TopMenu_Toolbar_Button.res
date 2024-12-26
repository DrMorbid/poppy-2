open ReactIntl

module Classes = {
  let label = Mui.Sx.obj({
    fontSize: String(App_Theme.Typography.h5.fontSize),
    fontWeight: String(App_Theme.Typography.h5.fontWeight),
    lineHeight: Number(1.334),
  })
}

@react.component
let make = (~label, ~onClick, ~index) => {
  let intl = useIntl()

  let pickColor = (): Mui.Button.color =>
    switch index->Int.mod(4) {
    | 0 => Primary
    | 1 => Error
    | 2 => Secondary
    | 3 => Success
    | _ => Info
    }

  <Mui.Button size=Large variant=Contained color={pickColor()} onClick sx=Classes.label>
    {intl->ReactIntl.Intl.formatMessage(label)->React.string}
  </Mui.Button>
}
