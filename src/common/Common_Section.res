open ReactDOM
open Emotion

module Classes = {
  let coloredBackground = (theme: Mui.Theme.t, prefersDarkMode) =>
    Style.make(
      ~backgroundColor=theme.palette.secondary.light->Utils.Style.mixColors(
        ~with=prefersDarkMode ? theme.palette.grey.\"800" : theme.palette.grey.\"100",
        ~transparency1=#background,
        ~transparency2=#background,
        ~percentage1=5,
      ),
      (),
    )->styleToClass
  let accentedBackgroundYellow = (theme: Mui.Theme.t) =>
    Style.make(
      ~backgroundColor=theme.palette.secondary.light->App_Theme.Transparency.addTransparency(
        #background,
      ),
      (),
    )->styleToClass
  let accentedBackgroundGreen = (theme: Mui.Theme.t) =>
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
  let prefersDarkMode = Mui.Core.useMediaQueryString(Common_Constants.darkModeMediaQuery)

  let theme = MuiStyles.useTheme()

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

  <Mui.Grid item=true xs=Number(12) className={createContainerStyling()}> children </Mui.Grid>
}
