@react.component
let make = () => {
  let prefersDarkMode = Mui.Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)

  <IntlProvider>
    <App.Context.Provider>
      <Mui.ThemeProvider theme={Theme(App_Theme.theme(~prefersDarkMode))}>
        <Mui.CssBaseline />
        <MuiStyles.StylesProvider injectFirst=true>
          <MuiPickers.UtilsProvider
            utils=MuiPickers.UtilsProvider.dateFnsUtils locale=MuiPickers.UtilsProvider.csLocale>
            <App />
          </MuiPickers.UtilsProvider>
        </MuiStyles.StylesProvider>
      </Mui.ThemeProvider>
    </App.Context.Provider>
  </IntlProvider>
}
