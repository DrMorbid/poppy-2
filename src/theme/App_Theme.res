open Mui.ThemeOptions
open Mui.Theme
open Mui.Colors
open ReactDOM

module Transparency = {
  let text = "de"
  let background = "bf"

  let addTransparency = (color, kind: [#text | #background]) => {
    let normalizeColor = color =>
      if color->String.length == 4 {
        color->String.charAt(0) ++
        color->String.charAt(1) ++
        color->String.charAt(1) ++
        color->String.charAt(2) ++
        color->String.charAt(2) ++
        color->String.charAt(3) ++
        color->String.charAt(3)
      } else {
        color
      }

    color->normalizeColor ++
      switch kind {
      | #background => "bf"
      | #text => "de"
      }
  }
}
open Transparency

let theme = (~prefersDarkMode) => {
  let palette = {
    "primary": prefersDarkMode ? lightBlue["700"] : lightBlue["200"],
    "secondary": prefersDarkMode ? yellow["700"] : yellow["200"],
    "error": prefersDarkMode ? red["700"] : red["200"],
    "warning": prefersDarkMode ? orange["700"] : orange["200"],
    "info": prefersDarkMode ? blue["700"] : blue["200"],
    "success": prefersDarkMode ? green["700"] : green["200"],
    "text": prefersDarkMode ? common["white"] : common["black"],
  }

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
      ~breakpoints=Breakpoints.make(
        ~values=BreakpointValues.make(~xs=0., ~sm=600., ~md=900., ~lg=1200., ~xl=1536., ()),
        (),
      ),
      ~palette=PaletteOptions.make(
        ~\"type"=prefersDarkMode ? "dark" : "light",
        ~primary=Primary.make(~main=palette["primary"], ()),
        ~secondary=Secondary.make(~main=palette["secondary"], ()),
        ~error=Mui.ThemeOptions.Error.make(~main=palette["error"], ()),
        ~warning=Warning.make(~main=palette["warning"], ()),
        ~info=Info.make(~main=palette["info"], ()),
        ~success=Success.make(~main=palette["success"], ()),
        ~text=TypeText.make(~primary=palette["text"]->addTransparency(#text), ()),
        (),
      ),
      ~overrides=Overrides.make(
        ~\"MuiButton"=ButtonClassKey.make(
          ~containedPrimary=Style.make(~color=palette["text"]->addTransparency(#text), ()),
          (),
        ),
        ~\"MuiButtonBase"=ButtonBaseClassKey.make(
          ~root=Style.make(~color=palette["text"]->addTransparency(#text), ()),
          (),
        ),
        ~\"MuiIconButton"=IconButtonClassKey.make(
          ~root=Style.make(~color=palette["text"]->addTransparency(#text), ()),
          (),
        ),
        ~\"MuiFab"=FabClassKey.make(
          ~primary=Style.make(~color=palette["text"]->addTransparency(#text), ()),
          (),
        ),
        ~\"MuiAccordion"=AccordionClassKey.make(
          ~root=Style.make(~backgroundColor="transparent", ()),
          (),
        ),
        ~\"MuiPaper"=PaperClassKey.make(~elevation1=Style.make(~boxShadow="unset", ()), ()),
        ~\"MuiAppBar"=AppBarClassKey.make(
          ~colorPrimary=Style.make(
            ~backgroundColor=palette["primary"]->addTransparency(#background),
            (),
          )->Obj.magic,
          (),
        ),
        (),
      ),
      (),
    ),
  )
}
