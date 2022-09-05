open Mui

@react.component
let make = () =>
  <IntlProvider>
    <ThemeProvider theme=App_Theme.theme>
      <CssBaseline />
      <App />
    </ThemeProvider>
  </IntlProvider>
