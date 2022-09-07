open Mui.Theme
open Mui.ThemeOptions

let theme = create(
  make(
    ~palette=PaletteOptions.make(
      ~primary=Primary.make(~main="#ffffff", ()),
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
