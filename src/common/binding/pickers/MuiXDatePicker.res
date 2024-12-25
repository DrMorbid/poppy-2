type adapterLocale
type dateAdapter

// TODO: Had to implement myself. Watch out for future updates.

module LocalizationProvider = {
  @module("@mui/x-date-pickers/AdapterDayjs")
  external adapterDayjs: dateAdapter = "AdapterDayjs"

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
    type textField = {helperText?: Jsx.element, error?: bool, variant?: Mui.TextField.variant}

    type t = {textField?: textField}
  }

  @react.component @module("@mui/x-date-pickers/DatePicker")
  external make: (
    ~disableFuture: bool=?,
    ~openTo: view=?,
    ~format: string=?,
    ~label: React.element=?,
    ~views: array<view>=?,
    ~value: Dayjs.t=?,
    ~onChange: Nullable.t<Dayjs.t> => unit=?,
    ~required: bool=?,
    ~name: string=?,
    ~minDate: Dayjs.t=?,
    ~maxDate: Dayjs.t=?,
    ~onError: (Nullable.t<error>, Nullable.t<Dayjs.t>) => unit=?,
    ~sx: Mui.Sx.props=?,
    ~slotProps: SlotProps.t=?,
  ) => React.element = "DatePicker"
}

module Dayjs = {
  @module("dayjs/locale/cs") external csLocale: adapterLocale = "default"
}
