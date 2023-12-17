@react.component
let make = () => {
  let prefersDarkMode = Mui.Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)

  <IntlProvider>
    <App.Context.Provider>
      <Mui.ThemeProvider theme={Theme(App_Theme.theme(~prefersDarkMode))}>
        <Mui.CssBaseline />
        <MuiXDatePicker.LocalizationProvider
          dateAdapter=MuiXDatePicker.LocalizationProvider.adapterDateFns
          adapterLocale=DateFns.csLocale>
          <App />
        </MuiXDatePicker.LocalizationProvider>
      </Mui.ThemeProvider>
    </App.Context.Provider>
  </IntlProvider>
}
