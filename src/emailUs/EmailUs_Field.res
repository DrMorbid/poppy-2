open EmailUs_Form

type type_ = [#text | #email | #tel]

type grid = {
  xs: Mui.Grid.autoNumberBool,
  sm: Mui.Grid.autoNumberBool,
  md: Mui.Grid.autoNumberBool,
  lg: Mui.Grid.autoNumberBool,
  xl: Mui.Grid.autoNumberBool,
}
type fieldGrid = {
  notLast: grid,
  last: grid,
}

let fieldGrid = {
  notLast: {
    xs: Number(12),
    sm: Number(6),
    md: Number(4),
    lg: Number(3),
    xl: Number(2),
  },
  last: {
    xs: Number(12),
    sm: Number(12),
    md: Number(12),
    lg: Number(6),
    xl: Number(6),
  },
}

@react.component
let make = (
  ~label,
  ~field: Field.t,
  ~renderWithRegister,
  ~autoFocus=?,
  ~type_: type_=#text,
  ~multiline=?,
  ~last=false,
) => {
  let intl = ReactIntl.useIntl()

  <Mui.Grid
    item=true
    xs={last ? fieldGrid.last.xs : fieldGrid.notLast.xs}
    sm={last ? fieldGrid.last.sm : fieldGrid.notLast.sm}
    md={last ? fieldGrid.last.md : fieldGrid.notLast.md}
    lg={last ? fieldGrid.last.lg : fieldGrid.notLast.lg}
    xl={last ? fieldGrid.last.xl : fieldGrid.notLast.xl}>
    {renderWithRegister(
      <Mui.TextField
        ?autoFocus
        fullWidth=true
        margin=None
        label={intl->ReactIntl.Intl.formatMessage(label)->Jsx.string}
        required=field.required
        type_={(type_ :> string)}
        ?multiline
      />,
    )}
  </Mui.Grid>
}
