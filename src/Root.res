open Mui

@react.component
let make = () => {
  let prefersDarkMode = Mui.Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)

  <IntlProvider>
    <App.Context.Provider>
      <ThemeProvider theme={App_Theme.theme(~prefersDarkMode)}>
        <CssBaseline />
        <StylesProvider injectFirst=true>
          <MuiPickers.UtilsProvider
            utils=MuiPickers.UtilsProvider.dateFnsUtils locale=MuiPickers.UtilsProvider.csLocale>
            <App />
          </MuiPickers.UtilsProvider>
        </StylesProvider>
      </ThemeProvider>
    </App.Context.Provider>
  </IntlProvider>
}
