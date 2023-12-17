open ReactDOM
open Emotion

module Classes = {
  let coloredBackground = prefersDarkMode =>
    Style.make(
      ~backgroundColor=App_Theme.theme(
        ~prefersDarkMode,
      ).palette.secondary.light->Utils.Style.mixColors(
        ~with=prefersDarkMode ? Mui.Colors.grey["800"] : Mui.Colors.grey["100"],
        ~transparency1=#background,
        ~transparency2=#background,
        ~percentage1=5,
      ),
      (),
    )->styleToClass
  let accentedBackgroundYellow = prefersDarkMode =>
    Style.make(
      ~backgroundColor=App_Theme.theme(
        ~prefersDarkMode,
      ).palette.secondary.light->App_Theme.Transparency.addTransparency(#background),
      (),
    )->styleToClass
  let accentedBackgroundGreen = prefersDarkMode =>
    Style.make(
      ~backgroundColor=App_Theme.theme(
        ~prefersDarkMode,
      ).palette.success.main->App_Theme.Transparency.addTransparency(#background),
      (),
    )->styleToClass
}

type accented = Yellow | Green

type coloring = Transparent | Colored | Accented(accented)

@react.component
let make = (~coloring=Transparent, ~children) => {
  let prefersDarkMode = Mui.Core.useMediaQueryString(Common_Constants.darkModeMediaQuery)

  let createContainerStyling = () =>
    switch coloring {
    | Colored => cx([Common_Style.pageGuttersComplete, Classes.coloredBackground(prefersDarkMode)])
    | Accented(Yellow) =>
      cx([Common_Style.pageGuttersComplete, Classes.accentedBackgroundYellow(prefersDarkMode)])
    | Accented(Green) =>
      cx([Common_Style.pageGuttersComplete, Classes.accentedBackgroundGreen(prefersDarkMode)])
    | Transparent => Common_Style.pageGuttersComplete
    }

  <Mui.Grid item=true xs=Number(12) className={createContainerStyling()}> children </Mui.Grid>
}
