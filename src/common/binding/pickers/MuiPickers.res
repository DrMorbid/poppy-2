module UtilsProvider = {
  type utils
  type locale

  @module("@date-io/date-fns") external dateFnsUtils: utils = "default"
  @module("date-fns/locale/cs") external csLocale: locale = "default"

  @react.component @module("@material-ui/pickers")
  external make: (~utils: utils, ~locale: locale, ~children: React.element) => React.element =
    "MuiPickersUtilsProvider"
}

module DatePicker = {
  type view = [#date | #year | #month]

  @react.component @module("@material-ui/pickers")
  external make: (
    ~disableFuture: bool=?,
    ~openTo: view=?,
    ~format: string=?,
    ~label: React.element=?,
    ~views: array<view>=?,
    ~value: Date.t=?,
    ~onChange: Date.t => unit=?,
    ~fullWidth: bool=?,
    ~margin: Mui.FormControl.margin=?,
    ~required: bool=?,
    ~initialFocusedDate: Date.t=?,
    ~name: string=?,
    ~clearable: bool=?,
    ~error: bool=?,
    ~helperText: React.element=?,
    ~minDate: Date.t=?,
    ~maxDate: Date.t=?,
    ~\"type": string=?,
    ~inputProps: {..}=?,
  ) => React.element = "DatePicker"
}
