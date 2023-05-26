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
  let accentedBackground = (theme: Theme.t) =>
    Style.make(
      ~backgroundColor=theme.palette.secondary.light->App_Theme.Transparency.addTransparency(
        #background,
      ),
      (),
    )->styleToClass
}

type coloring = Transparent | Colored | Accented

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
    | Accented => cx([Common_Style.pageGuttersComplete(theme), Classes.accentedBackground(theme)])
    | Transparent => Common_Style.pageGuttersComplete(theme)
    }

  <Grid item=true xs=Xs.\"12" className={createContainerStyling()}> children </Grid>
}
