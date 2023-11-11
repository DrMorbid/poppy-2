open Mui.ThemeOptions
open Mui.Theme
open Mui.Colors
open ReactDOM

module Transparency = {
  let text = "de"
  let background = "bf"

  type kind = [#text | #background]

  let addTransparency = (color, kind: kind) => {
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
      | #text => "f2"
      }
  }
}
open Transparency

let theme = (~prefersDarkMode) => {
  let palette = {
    "primary": prefersDarkMode ? lightBlue["700"] : lightBlue["300"],
    "primaryLight": prefersDarkMode ? lightBlue["900"] : lightBlue["100"],
    "primaryDark": prefersDarkMode ? lightBlue["600"] : lightBlue["500"],
    "primaryContrastText": prefersDarkMode ? lightBlue["A700"] : lightBlue["A200"],
    "secondary": prefersDarkMode ? orange["800"] : yellow["500"],
    "secondaryLight": prefersDarkMode ? orange["900"] : yellow["200"],
    "secondaryDark": prefersDarkMode ? orange["800"] : yellow["700"],
    "secondaryContrastText": prefersDarkMode ? orange["900"] : yellow["A400"],
    "error": prefersDarkMode ? red["600"] : deepOrange["300"],
    "errorLight": prefersDarkMode ? red["800"] : deepOrange["100"],
    "errorDark": prefersDarkMode ? red["400"] : deepOrange["400"],
    "errorContrastText": prefersDarkMode ? red["A700"] : deepOrange["A400"],
    "warning": prefersDarkMode ? orange["800"] : orange["400"],
    "warningLight": prefersDarkMode ? orange["900"] : orange["200"],
    "warningDark": prefersDarkMode ? orange["800"] : orange["600"],
    "warningContrastText": prefersDarkMode ? orange["A700"] : orange["A400"],
    "info": prefersDarkMode ? lime["900"] : lime["400"],
    "infoLight": prefersDarkMode ? lime["900"] : lime["200"],
    "infoDark": prefersDarkMode ? lime["900"] : lime["600"],
    "infoContrastText": prefersDarkMode ? lime["A700"] : lime["A400"],
    "success": prefersDarkMode ? lightGreen["800"] : lightGreen["300"],
    "successLight": prefersDarkMode ? lightGreen["900"] : lightGreen["100"],
    "successDark": prefersDarkMode ? lightGreen["700"] : lightGreen["500"],
    "successContrastText": prefersDarkMode ? lightGreen["A700"] : lightGreen["A100"],
    "text": prefersDarkMode ? grey["50"] : grey["900"],
  }

  create({
    typography: {
      fontFamily: "Maven Pro",
      h1: Obj.magic({
        "fontFamily": "Comfortaa",
        "fontSize": "2.8rem",
        "fontWeight": "800",
      }),
      h2: Obj.magic({
        "fontFamily": "Comfortaa",
        "fontSize": "2.3rem",
        "fontWeight": "700",
      }),
      h3: Obj.magic({
        "fontFamily": "Comfortaa",
        "fontSize": "1.9rem",
        "fontWeight": "600",
      }),
      h4: Obj.magic({
        "fontFamily": "Comfortaa",
        "fontSize": "1.6rem",
        "fontWeight": "600",
      }),
      h5: Obj.magic({
        "fontFamily": "Comfortaa",
        "fontSize": "1.4rem",
        "fontWeight": "500",
      }),
      h6: Obj.magic({
        "fontFamily": "Comfortaa",
        "fontSize": "1.2rem",
        "fontWeight": "500",
      }),
    },
    breakpoints: {
      values: {
        lg: 0.,
        md: 600.,
        sm: 900.,
        xl: 1200.,
        xs: 1536.,
      },
    },
    palette: {
      \"type": prefersDarkMode ? "dark" : "light",
      primary: {
        main: palette["primary"],
        light: palette["primaryLight"],
        dark: palette["primaryDark"],
        contrastText: palette["primaryContrastText"],
      },
      secondary: {
        main: palette["secondary"],
        light: palette["secondaryLight"],
        dark: palette["secondaryDark"],
        contrastText: palette["secondaryContrastText"],
      },
      error: {
        main: palette["error"],
        light: palette["errorLight"],
        dark: palette["errorDark"],
        contrastText: palette["errorContrastText"],
      },
      warning: {
        main: palette["warning"],
        light: palette["warningLight"],
        dark: palette["warningDark"],
        contrastText: palette["warningContrastText"],
      },
      info: {
        main: palette["info"],
        light: palette["infoLight"],
        dark: palette["infoDark"],
        contrastText: palette["infoContrastText"],
      },
      success: {
        main: palette["success"],
        light: palette["successLight"],
        dark: palette["successDark"],
        contrastText: palette["successContrastText"],
      },
      text: {
        primary: palette["text"]->addTransparency(#text),
      },
    },
    components: {
      muiButton: {
        styleOverrides: {
          containedPrimary: Style.make(~color=palette["text"]->addTransparency(#text), ()),
        },
      },
      muiButtonBase: {
        styleOverrides: {
          root: Style.make(~color=palette["text"]->addTransparency(#text), ()),
        },
      },
      muiIconButton: {
        styleOverrides: {
          root: Style.make(~color=palette["text"]->addTransparency(#text), ()),
        },
      },
      muiFab: {
        styleOverrides: {
          primary: Style.make(~color=palette["text"]->addTransparency(#text), ()),
        },
      },
      muiAccordion: {
        styleOverrides: {
          root: Style.make(
            ~backgroundColor=(prefersDarkMode ? grey["900"] : common["white"])->addTransparency(
              #background,
            ),
            (),
          ),
        },
      },
      muiAppBar: {
        styleOverrides: {
          colorPrimary: Style.make(
            ~backgroundColor=palette["primary"]->addTransparency(#background),
            (),
          )->Obj.magic,
          colorSecondary: Style.make(
            ~backgroundColor=palette["secondary"]->addTransparency(#background),
            (),
          )->Obj.magic,
        },
      },
    },
  })
}
