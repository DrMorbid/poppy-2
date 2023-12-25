@react.component
let make = (~open_, ~severity: Mui.Alert.severity, ~onClose, ~messageValues=?, ~children) => {
  let intl = ReactIntl.useIntl()

  <Mui.Snackbar
    open_ anchorOrigin={horizontal: Center, vertical: Top} onClose autoHideDuration=Number(10_000.)>
    <Mui.Alert severity variant=Filled onClose={event => event->onClose(Mui.Snackbar.Clickaway)}>
      {messageValues
      ->Option.mapWithDefault(intl->ReactIntl.Intl.formatMessage(children), values =>
        intl->ReactIntl.Intl.formatMessageWithValues(children, values)
      )
      ->Jsx.string}
    </Mui.Alert>
  </Mui.Snackbar>
}
