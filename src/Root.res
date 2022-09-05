open Mui

@react.component
let make = () =>
  <IntlProvider>
    <App.Context.Provider>
      <ThemeProvider theme=App_Theme.theme>
        <CssBaseline />
        <App />
      </ThemeProvider>
    </App.Context.Provider>
  </IntlProvider>
