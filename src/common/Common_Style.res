open ReactDOM
open Utils.Style
open Emotion

let pagePaddingXs = "1rem"
let pagePaddingSm = "2rem"
let pagePaddingMdUp = "3rem"

let headerGap = Mui.Sx.obj({marginTop: String("2rem")})
let paragraphGap = Style.make(~gridRowGap="1rem", ())->styleToClass
let sectionGap = Style.make(~gridRowGap="2rem", ())->styleToClass
let bold = Style.make(~fontWeight="bold !important", ())->styleToClass
let marginTopSm = Style.make(~marginTop="0.75rem !important", ())->styleToClass
let marginBottomSm = Style.make(~marginBottom="0.75rem !important", ())->styleToClass
let marginBottom = Style.make(~marginBottom="1rem !important", ())->styleToClass
let fullWidth = Style.make(~width="100% !important", ())->styleToClass
let centeredText = Style.make(~textAlign="center !important", ())->styleToClass
let pageGuttersTop =
  list{
    Style.make(~paddingTop=`${pagePaddingXs} !important`, ())->styleWithMediaQuery(
      ~addMediaPrefix=true,
      ~mediaQuery=App_Theme.Breakpoint.xsUp,
    ),
    Style.make(~paddingTop=`${pagePaddingSm} !important`, ())->styleWithMediaQuery(
      ~addMediaPrefix=true,
      ~mediaQuery=App_Theme.Breakpoint.smUp,
    ),
    Style.make(~paddingTop=`${pagePaddingMdUp} !important`, ())->styleWithMediaQuery(
      ~addMediaPrefix=true,
      ~mediaQuery=App_Theme.Breakpoint.mdUp,
    ),
  }
  ->stylesCombiner
  ->styleToClass
let pageGuttersComplete =
  list{
    Style.make(~padding=`${pagePaddingXs} !important`, ())->styleWithMediaQuery(
      ~addMediaPrefix=true,
      ~mediaQuery=App_Theme.Breakpoint.xsUp,
    ),
    Style.make(~padding=`${pagePaddingSm} !important`, ())->styleWithMediaQuery(
      ~addMediaPrefix=true,
      ~mediaQuery=App_Theme.Breakpoint.smUp,
    ),
    Style.make(~padding=`${pagePaddingMdUp} !important`, ())->styleWithMediaQuery(
      ~addMediaPrefix=true,
      ~mediaQuery=App_Theme.Breakpoint.mdUp,
    ),
  }
  ->stylesCombiner
  ->styleToClass
let islandsVerticalGap = Style.make(~gridRowGap="2rem !important", ())->styleToClass
let islandsHorizontalGap =
  Style.make(~paddingLeft="1rem !important", ~paddingRight="1rem !important", ())->styleToClass
let uppercaseText = Style.make(~textTransform="uppercase !important", ())->styleToClass
