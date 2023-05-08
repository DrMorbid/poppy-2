open Mui
open Mui.Grid
open ReactDOM
open Emotion

module Classes = {
  let background = (theme: Theme.t) =>
    Style.make(
      ~backgroundColor=theme.palette.secondary.light->App_Theme.Transparency.addTransparency(
        #background,
      ),
      (),
    )->styleToClass
}

@react.component
let make = (~colored=false, ~children) => {
  let prefersDarkMode = Core.useMediaQueryString(Common_Constants.darkModeMediaQuery)
  let theme = Core.useTheme()

  let createContainerStyling = () =>
    switch (colored, prefersDarkMode) {
    | (true, true) => cx([Common_Style.pageGuttersComplete(theme), Classes.background(theme)])
    | (true, false) => cx([Common_Style.pageGuttersComplete(theme), Classes.background(theme)])
    | (false, _) => Common_Style.pageGuttersComplete(theme)
    }

  <Grid item=true xs=Xs.\"12" className={createContainerStyling()}> children </Grid>
}
