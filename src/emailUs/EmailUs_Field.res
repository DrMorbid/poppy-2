open EmailUs_Form
open Mui
open Mui.Grid

@react.component
let make = (~label, ~field: Field.t, ~renderWithRegister) => {
  let intl = ReactIntl.useIntl()

  <Grid item=true xs=Xs.\"12" sm=Sm.\"6" md=Md.\"4" lg=Lg.\"3" xl=Xl.\"2">
    {renderWithRegister(
      <TextField
        autoFocus=true
        fullWidth=true
        margin=#none
        label={intl->ReactIntl.Intl.formatMessage(label)->Jsx.string}
        required=field.required
      />,
    )}
  </Grid>
}
