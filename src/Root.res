@react.component
let make = () => {
  let prefersDarkMode = Mui.Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)

  <IntlProvider>
    <App.Context.Provider>
      <Mui.ThemeProvider theme={Theme(App_Theme.theme(~prefersDarkMode))}>
        <Mui.CssBaseline />
        <MuiPickers.UtilsProvider
          utils=MuiPickers.UtilsProvider.dateFnsUtils locale=MuiPickers.UtilsProvider.csLocale>
          <App />
        </MuiPickers.UtilsProvider>
      </Mui.ThemeProvider>
    </App.Context.Provider>
  </IntlProvider>
}
