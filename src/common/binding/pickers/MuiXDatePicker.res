type adapterLocale
type dateAdapter

module LocalizationProvider = {
  @module("@mui/x-date-pickers/AdapterDateFns")
  external adapterDateFns: dateAdapter = "AdapterDateFns"

  @react.component @module("@mui/x-date-pickers/LocalizationProvider")
  external make: (
    ~adapterLocale: adapterLocale,
    ~dateAdapter: dateAdapter,
    ~children: React.element,
  ) => React.element = "LocalizationProvider"
}

module DatePicker = {
  type view = [#day | #month | #year]
  type error = [
    | #invalidDate
    | #disableFuture
    | #disablePast
    | #shouldDisableDate
    | #shouldDisableMonth
    | #shouldDisableYear
    | #minDate
    | #maxDate
    | #minutesStep
    | #minTime
    | #maxTime
    | #"shouldDisableClock-hours"
    | #"shouldDisableClock-minutes"
    | #"shouldDisableClock-seconds"
    | #"shouldDisableTime-hours"
    | #"shouldDisableTime-minutes"
    | #"shouldDisableTime-seconds"
  ]

  module SlotProps = {
    type textField = {helperText?: string, error?: bool}

    type t = {textField?: textField}
  }

  @react.component @module("@mui/x-date-pickers/DatePicker")
  external make: (
    ~disableFuture: bool=?,
    ~openTo: view=?,
    ~format: string=?,
    ~label: React.element=?,
    ~views: array<view>=?,
    ~value: Date.t=?,
    ~onChange: Nullable.t<Date.t> => unit=?,
    ~required: bool=?,
    ~name: string=?,
    ~minDate: Date.t=?,
    ~maxDate: Date.t=?,
    ~onError: (Nullable.t<error>, Nullable.t<Date.t>) => unit=?,
    ~sx: Mui.Sx.props=?,
    ~slotProps: SlotProps.t=?,
  ) => React.element = "DatePicker"
}
