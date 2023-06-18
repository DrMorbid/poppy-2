open EmailUs_Form
open Mui
open Mui.Grid

type \"type" = [#text | #email | #tel]

type grid = {xs: Grid.Xs.t, sm: Grid.Sm.t, md: Grid.Md.t, lg: Grid.Lg.t, xl: Grid.Xl.t}
type fieldGrid = {
  notLast: grid,
  last: grid,
}

let fieldGrid = {
  notLast: {
    xs: Xs.\"12",
    sm: Sm.\"6",
    md: Md.\"4",
    lg: Lg.\"3",
    xl: Xl.\"2",
  },
  last: {
    xs: Xs.\"12",
    sm: Sm.\"12",
    md: Md.\"12",
    lg: Lg.\"6",
    xl: Xl.\"6",
  },
}

@react.component
let make = (
  ~label,
  ~field: Field.t,
  ~renderWithRegister,
  ~autoFocus=?,
  ~\"type": \"type"=#text,
  ~multiline=?,
  ~last=false,
) => {
  let intl = ReactIntl.useIntl()

  <Grid
    item=true
    xs={last ? fieldGrid.last.xs : fieldGrid.notLast.xs}
    sm={last ? fieldGrid.last.sm : fieldGrid.notLast.sm}
    md={last ? fieldGrid.last.md : fieldGrid.notLast.md}
    lg={last ? fieldGrid.last.lg : fieldGrid.notLast.lg}
    xl={last ? fieldGrid.last.xl : fieldGrid.notLast.xl}>
    {renderWithRegister(
      <TextField
        ?autoFocus
        fullWidth=true
        margin=#none
        label={intl->ReactIntl.Intl.formatMessage(label)->Jsx.string}
        required=field.required
        \"type"={(\"type" :> string)}
        ?multiline
      />,
    )}
  </Grid>
}
