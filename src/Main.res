@@directive("'use client';")

@react.component
let make = (~children) => {
  let prefersDarkMode = Mui.Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)

  <IntlProvider>
    <App.Context.Provider>
      <MuiNext.AppRouterCacheProvider>
        <Mui.ThemeProvider theme={Theme(App_Theme.theme(~prefersDarkMode))}>
          <Mui.CssBaseline />
          <MuiXDatePicker.LocalizationProvider
            dateAdapter=MuiXDatePicker.LocalizationProvider.adapterDayjs
            adapterLocale=MuiXDatePicker.Dayjs.csLocale>
            <main>
              <App> {children} </App>
            </main>
          </MuiXDatePicker.LocalizationProvider>
        </Mui.ThemeProvider>
      </MuiNext.AppRouterCacheProvider>
    </App.Context.Provider>
  </IntlProvider>
}
