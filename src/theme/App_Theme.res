open Mui.Theme
open Mui.ThemeOptions

type colors = {primary: string}

let getColors = (~prefersDarkTheme) => {
  primary: prefersDarkTheme ? "#303030" : "#fafafa",
}

let theme = (~prefersDarkTheme) => {
  let colors = getColors(~prefersDarkTheme)

  create(
    make(
      ~palette=PaletteOptions.make(
        ~\"type"=prefersDarkTheme ? "dark" : "light",
        ~primary=Primary.make(~main=colors.primary, ()),
        ~secondary=Secondary.make(~main="#009ada", ()),
        ~error=Error.make(~main="#de0522", ()),
        ~warning=Warning.make(~main="#f1a300", ()),
        ~info=Info.make(~main="#ffe401", ()),
        ~success=Success.make(~main="#68a130", ()),
        (),
      ),
      (),
    ),
  )
}
