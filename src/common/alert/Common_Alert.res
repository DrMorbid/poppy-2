module Type = Common_Alert_Type

@react.component
let make = (~open_, ~children: option<Type.t<{..}>>) => {
  let intl = ReactIntl.useIntl()

  <Mui.Snackbar
    open_
    anchorOrigin={horizontal: Center, vertical: Top}
    onClose=?{children->Option.map(({onClose}) => onClose)}
    autoHideDuration=Number(10_000.)>
    <Mui.Alert
      severity=?{children->Option.map(({severity}) => severity)}
      variant=Filled
      onClose={event =>
        children->Option.forEach(({onClose}) => event->onClose(Mui.Snackbar.Clickaway))}>
      {children
      ->Option.flatMap(({?bodyParameters}) => bodyParameters)
      ->Option.flatMap(bodyParameters =>
        children->Option.map(({body}) =>
          intl->ReactIntl.Intl.formatMessageWithValues(body, bodyParameters)
        )
      )
      ->Option.getOr(
        children
        ->Option.map(({body}) => intl->ReactIntl.Intl.formatMessage(body))
        ->Option.getOr(""),
      )
      ->Jsx.string}
    </Mui.Alert>
  </Mui.Snackbar>
}
