open Mui

@react.component
let make = () =>
  <ThemeProvider theme=App_Theme.theme>
    <CssBaseline />
    <App />
  </ThemeProvider>
