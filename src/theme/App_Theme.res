open Mui.Theme
open Mui.ThemeOptions
open ReactDOM

module Colors = {
  let blue = "#009ada"
  let green = "#68a130"
  let yellow = "#ffe401"
  let orange = "#f1a300"
  let red = "#de0522"
  let textLight = "rgba(0, 0, 0, 0.87)"
  let textDark = "rgba(255, 255,255, 0.87)"
}

let theme = (~prefersDarkMode) => {
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
        ~primary=Primary.make(~main=Colors.blue, ()),
        ~secondary=Secondary.make(~main=Colors.yellow, ()),
        ~error=Error.make(~main=Colors.red, ()),
        ~warning=Warning.make(~main=Colors.orange, ()),
        ~info=Info.make(~main=Colors.blue, ()),
        ~success=Success.make(~main=Colors.green, ()),
        ~text=TypeText.make(~primary=prefersDarkMode ? Colors.textDark : Colors.textLight, ()),
        (),
      ),
      ~overrides=Overrides.make(
        ~\"MuiButton"=ButtonClassKey.make(
          ~containedPrimary=Style.make(~color=prefersDarkMode ? Colors.textDark : "#ffffff", ()),
          (),
        ),
        ~\"MuiButtonBase"=ButtonBaseClassKey.make(
          ~root=Style.make(~color=prefersDarkMode ? Colors.textDark : Colors.textLight, ()),
          (),
        ),
        ~\"MuiIconButton"=IconButtonClassKey.make(
          ~root=Style.make(~color=prefersDarkMode ? Colors.textDark : Colors.textLight, ()),
          (),
        ),
        ~\"MuiFab"=FabClassKey.make(
          ~primary=Style.make(~color=prefersDarkMode ? Colors.textDark : "#ffffff", ()),
          (),
        ),
        ~\"MuiAccordion"=AccordionClassKey.make(
          ~root=Style.make(~backgroundColor="transparent", ()),
          (),
        ),
        (),
      ),
      (),
    ),
  )
}
