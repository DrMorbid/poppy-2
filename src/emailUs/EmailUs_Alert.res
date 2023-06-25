open Mui
open MuiLab

@react.component
let make = (~\"open", ~severity: Alert.severity, ~onClose, ~messageValues=?, ~children) => {
  let intl = ReactIntl.useIntl()

  <Snackbar
    \"open"
    anchorOrigin={Snackbar.AnchorOrigin.make(~horizontal=#center, ~vertical=#top, ())}
    onClose
    autoHideDuration={10_000->Mui.Number.int}>
    <Alert severity variant=#filled onClose={event => event->onClose("clickaway")}>
      {messageValues
      ->Option.mapWithDefault(intl->ReactIntl.Intl.formatMessage(children), values =>
        intl->ReactIntl.Intl.formatMessageWithValues(children, values)
      )
      ->Jsx.string}
    </Alert>
  </Snackbar>
}
