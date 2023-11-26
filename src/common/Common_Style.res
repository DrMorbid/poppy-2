open ReactDOM
open Utils.Style
open Emotion

let pagePaddingXs = "1rem"
let pagePaddingSm = "2rem"
let pagePaddingMdUp = "3rem"

let headerGap = Style.make(~marginTop="2rem", ())->styleToClass
let paragraphGap = Style.make(~gridRowGap="1rem", ())->styleToClass
let sectionGap = Style.make(~gridRowGap="2rem", ())->styleToClass
let bold = Style.make(~fontWeight="bold", ())->styleToClass
let marginTopSm = Style.make(~marginTop="0.75rem", ())->styleToClass
let marginBottomSm = Style.make(~marginBottom="0.75rem", ())->styleToClass
let marginBottom = Style.make(~marginBottom="1rem", ())->styleToClass
let fullWidth = Style.make(~width="100%", ())->styleToClass
let centeredText = Style.make(~textAlign="center", ())->styleToClass
let pageGuttersTop =
  list{
    Style.make(~paddingTop=pagePaddingMdUp, ())->styleWithMediaQuery(
      ~addMediaPrefix=true,
      ~mediaQuery=App_Theme.Breakpoint.smUp,
    ),
    Style.make(~paddingTop=pagePaddingSm, ())->styleWithMediaQuery(
      ~addMediaPrefix=true,
      ~mediaQuery=App_Theme.Breakpoint.xsUp,
    ),
    Style.make(~paddingTop=pagePaddingXs, ())->styleWithMediaQuery(
      ~addMediaPrefix=true,
      ~mediaQuery=App_Theme.Breakpoint.xsDown,
    ),
  }
  ->stylesCombiner
  ->styleToClass
let pageGuttersComplete =
  list{
    Style.make(~padding=pagePaddingMdUp, ())->styleWithMediaQuery(
      ~addMediaPrefix=true,
      ~mediaQuery=App_Theme.Breakpoint.smUp,
    ),
    Style.make(~padding=pagePaddingSm, ())->styleWithMediaQuery(
      ~addMediaPrefix=true,
      ~mediaQuery=App_Theme.Breakpoint.xsUp,
    ),
    Style.make(~padding=pagePaddingXs, ())->styleWithMediaQuery(
      ~addMediaPrefix=true,
      ~mediaQuery=App_Theme.Breakpoint.xsDown,
    ),
  }
  ->stylesCombiner
  ->styleToClass
let islandsVerticalGap = Style.make(~gridRowGap="2rem", ())->styleToClass
let islandsHorizontalGap = Style.make(~paddingLeft="1rem", ~paddingRight="1rem", ())->styleToClass
let uppercaseText = Style.make(~textTransform="uppercase", ())->styleToClass
