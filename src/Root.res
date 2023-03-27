open Mui

@react.component
let make = () => {
  let prefersDarkMode = Mui.Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)

  <IntlProvider>
    <App.Context.Provider>
      <ThemeProvider theme={App_Theme.theme(~prefersDarkMode)}>
        <CssBaseline />
        <StylesProvider injectFirst=true>
          <App />
        </StylesProvider>
      </ThemeProvider>
    </App.Context.Provider>
  </IntlProvider>
}
