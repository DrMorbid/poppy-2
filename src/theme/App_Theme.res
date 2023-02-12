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
      ~typography=Typography.make(
        ~fontFamily="Maven Pro",
        ~h1=Obj.magic({
          "fontFamily": "Comfortaa",
          "fontSize": "2.8rem",
          "fontWeight": "800",
        }),
        ~h2=Obj.magic({
          "fontFamily": "Comfortaa",
          "fontSize": "2.3rem",
          "fontWeight": "700",
        }),
        ~h3=Obj.magic({
          "fontFamily": "Comfortaa",
          "fontSize": "1.9rem",
          "fontWeight": "600",
        }),
        ~h4=Obj.magic({
          "fontFamily": "Comfortaa",
          "fontSize": "1.6rem",
          "fontWeight": "600",
        }),
        ~h5=Obj.magic({
          "fontFamily": "Comfortaa",
          "fontSize": "1.4rem",
          "fontWeight": "500",
        }),
        ~h6=Obj.magic({
          "fontFamily": "Comfortaa",
          "fontSize": "1.2rem",
          "fontWeight": "500",
        }),
        (),
      ),
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
