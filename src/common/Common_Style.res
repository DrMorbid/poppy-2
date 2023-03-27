open Mui
open ReactDOM
open Utils.Style
open Emotion

let pagePaddingXs = "1rem"
let pagePaddingSm = "2rem"
let pagePaddingMdUp = "3rem"

let headerGap = Style.make(~marginTop="2rem", ())->styleToClass
let paragraphGap = Style.make(~gridRowGap="1rem", ())->styleToClass
let sectionGap = Style.make(~gridRowGap="2rem", ())->styleToClass
let bold = Style.make(~fontWeight="bold !important", ())->styleToClass
let marginTopSm = Style.make(~marginTop="0.75rem", ())->styleToClass
let marginBottomSm = Style.make(~marginBottom="0.75rem", ())->styleToClass
let marginBottom = Style.make(~marginBottom="1rem", ())->styleToClass
let fullWidth = Style.make(~width="100%", ())->styleToClass
let centeredText = Style.make(~textAlign="center", ())->styleToClass
let pageGuttersTop = (theme: Mui.Theme.t) =>
  list{
    Style.make(~paddingTop=pagePaddingMdUp, ())->styleWithMediaQuery(
      ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("sm"),
    ),
    Style.make(~paddingTop=pagePaddingSm, ())->styleWithMediaQuery(
      ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("xs"),
    ),
    Style.make(~paddingTop=pagePaddingXs, ())->styleWithMediaQuery(
      ~mediaQuery=theme.breakpoints.down->Any.unsafeGetValue("xs"),
    ),
  }
  ->stylesCombiner
  ->styleToClass
let pageGuttersComplete = (theme: Mui.Theme.t) =>
  list{
    Style.make(~padding=pagePaddingMdUp, ())->styleWithMediaQuery(
      ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("sm"),
    ),
    Style.make(~padding=pagePaddingSm, ())->styleWithMediaQuery(
      ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("xs"),
    ),
    Style.make(~padding=pagePaddingXs, ())->styleWithMediaQuery(
      ~mediaQuery=theme.breakpoints.down->Any.unsafeGetValue("xs"),
    ),
  }
  ->stylesCombiner
  ->styleToClass
let islandsVerticalGap = Style.make(~gridRowGap="2rem", ())->styleToClass
let islandsHorizontalGap = Style.make(~paddingLeft="1rem", ~paddingRight="1rem", ())->styleToClass
let uppercaseText = Style.make(~textTransform="uppercase", ())->styleToClass
