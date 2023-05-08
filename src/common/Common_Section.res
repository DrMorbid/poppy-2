open Mui
open Mui.Grid
open ReactDOM
open Emotion

module Classes = {
  let coloredLight = Style.make(~backgroundColor="rgba(230, 230, 230, 0.75)", ())->styleToClass
  let coloredDark = Style.make(~backgroundColor="rgba(70, 70, 70, 0.75)", ())->styleToClass
}

@react.component
let make = (~colored=false, ~children) => {
  let prefersDarkMode = Core.useMediaQueryString(Common_Constants.darkModeMediaQuery)
  let theme = Core.useTheme()

  let createContainerStyling = () =>
    switch (colored, prefersDarkMode) {
    | (true, true) => cx([Common_Style.pageGuttersComplete(theme), Classes.coloredDark])
    | (true, false) => cx([Common_Style.pageGuttersComplete(theme), Classes.coloredLight])
    | (false, _) => Common_Style.pageGuttersComplete(theme)
    }

  <Grid item=true xs=Xs.\"12" className={createContainerStyling()}> children </Grid>
}
