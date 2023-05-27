open Mui
open Mui.Grid
open ReactDOM
open Emotion

module Classes = {
  let coloredBackground = (theme: Theme.t, prefersDarkMode) =>
    Style.make(
      ~backgroundColor=theme.palette.secondary.light->Utils.Style.mixColors(
        ~with=prefersDarkMode ? theme.palette.grey.\"800" : theme.palette.grey.\"100",
        ~transparency1=#background,
        ~transparency2=#background,
        ~percentage1=5,
      ),
      (),
    )->styleToClass
  let accentedBackgroundYellow = (theme: Theme.t) =>
    Style.make(
      ~backgroundColor=theme.palette.secondary.light->App_Theme.Transparency.addTransparency(
        #background,
      ),
      (),
    )->styleToClass
  let accentedBackgroundGreen = (theme: Theme.t) =>
    Style.make(
      ~backgroundColor=theme.palette.success.main->App_Theme.Transparency.addTransparency(
        #background,
      ),
      (),
    )->styleToClass
}

type accented = Yellow | Green

type coloring = Transparent | Colored | Accented(accented)

@react.component
let make = (~coloring=Transparent, ~children) => {
  let prefersDarkMode = Core.useMediaQueryString(Common_Constants.darkModeMediaQuery)
  let theme = Core.useTheme()

  let createContainerStyling = () =>
    switch coloring {
    | Colored =>
      cx([
        Common_Style.pageGuttersComplete(theme),
        Classes.coloredBackground(theme, prefersDarkMode),
      ])
    | Accented(Yellow) =>
      cx([Common_Style.pageGuttersComplete(theme), Classes.accentedBackgroundYellow(theme)])
    | Accented(Green) =>
      cx([Common_Style.pageGuttersComplete(theme), Classes.accentedBackgroundGreen(theme)])
    | Transparent => Common_Style.pageGuttersComplete(theme)
    }

  <Grid item=true xs=Xs.\"12" className={createContainerStyling()}> children </Grid>
}
