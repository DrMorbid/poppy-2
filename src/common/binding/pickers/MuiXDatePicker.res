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

  @react.component @module("@mui/x-date-pickers/DatePicker")
  external make: (
    ~disableFuture: bool=?,
    ~openTo: view=?,
    ~format: string=?,
    ~label: React.element=?,
    ~views: array<view>=?,
    ~value: Date.t=?,
    ~onChange: Date.t => unit=?,
    ~name: string=?,
    ~minDate: Date.t=?,
    ~maxDate: Date.t=?,
  ) => React.element = "DatePicker"
}
