open Mui

@react.component
let make = () => {
  let prefersDarkTheme = Mui.Core.useMediaQueryString("(prefers-color-scheme: dark)")

  <IntlProvider>
    <App.Context.Provider>
      <ThemeProvider theme={App_Theme.theme(~prefersDarkTheme)}>
        <CssBaseline />
        <App />
      </ThemeProvider>
    </App.Context.Provider>
  </IntlProvider>
}
