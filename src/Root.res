open Mui

@react.component
let make = () => {
  let prefersDarkMode = Mui.Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)

  <IntlProvider>
    <App.Context.Provider>
      <ThemeProvider theme={App_Theme.theme(~prefersDarkMode)}>
        <CssBaseline />
        <App />
      </ThemeProvider>
    </App.Context.Provider>
  </IntlProvider>
}
