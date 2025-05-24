type t<'a> = {
  severity: Mui.Alert.severity,
  body: ReactIntl.message,
  bodyParameters?: 'a,
  onClose: (ReactEvent.Synthetic.t, Mui.Snackbar.closeReason) => unit,
}
