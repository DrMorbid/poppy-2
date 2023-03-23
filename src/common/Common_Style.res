open Mui
open ReactDOM
open Utils.Style

let pagePaddingXs = "1rem"
let pagePaddingSm = "2rem"
let pagePaddingMdUp = "3rem"

let headerGap = Style.make(~marginTop="2rem", ())
let pageGuttersTop = (~theme: Theme.t) =>
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
  }->stylesCombiner
let pageGuttersWithoutTop = (~theme: Theme.t) =>
  list{
    Style.make(
      ~paddingRight=pagePaddingMdUp,
      ~paddingBottom=pagePaddingMdUp,
      ~paddingLeft=pagePaddingMdUp,
      (),
    )->styleWithMediaQuery(~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("sm")),
    Style.make(
      ~paddingRight=pagePaddingSm,
      ~paddingBottom=pagePaddingSm,
      ~paddingLeft=pagePaddingSm,
      (),
    )->styleWithMediaQuery(~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("xs")),
    Style.make(
      ~paddingRight=pagePaddingXs,
      ~paddingBottom=pagePaddingXs,
      ~paddingLeft=pagePaddingXs,
      (),
    )->styleWithMediaQuery(~mediaQuery=theme.breakpoints.down->Any.unsafeGetValue("xs")),
  }->stylesCombiner

let useStyles: Styles.useStyles<{
  "headerGap": string,
  "paragraphGap": string,
  "sectionGap": string,
  "bold": string,
  "marginTopSm": string,
  "marginBottomSm": string,
  "marginBottom": string,
  "fullWidth": string,
  "centeredText": string,
  "pageGuttersTop": string,
  "pageGuttersComplete": string,
  "islandsVerticalGap": string,
  "islandsHorizontalGap": string,
  "uppercaseText": string,
}> = Styles.makeStylesWithTheme(theme =>
  {
    "headerGap": headerGap,
    "paragraphGap": Style.make(~gridRowGap="1rem", ()),
    "sectionGap": Style.make(~gridRowGap="2rem", ()),
    "bold": Style.make(~fontWeight="bold !important", ()),
    "marginTopSm": Style.make(~marginTop="0.75rem", ()),
    "marginBottomSm": Style.make(~marginBottom="0.75rem", ()),
    "marginBottom": Style.make(~marginBottom="1rem", ()),
    "fullWidth": Style.make(~width="100%", ()),
    "centeredText": Style.make(~textAlign="center", ()),
    "pageGuttersTop": list{
      Style.make(~paddingTop=pagePaddingMdUp, ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("sm"),
      ),
      Style.make(~paddingTop=pagePaddingSm, ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("xs"),
      ),
      Style.make(~paddingTop=pagePaddingXs, ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.down->Any.unsafeGetValue("xs"),
      ),
    }->stylesCombiner,
    "pageGuttersComplete": list{
      Style.make(~padding=pagePaddingMdUp, ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("sm"),
      ),
      Style.make(~padding=pagePaddingSm, ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("xs"),
      ),
      Style.make(~padding=pagePaddingXs, ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.down->Any.unsafeGetValue("xs"),
      ),
    }->stylesCombiner,
    "islandsVerticalGap": Style.make(~gridRowGap="2rem", ()),
    "islandsHorizontalGap": Style.make(~paddingLeft="1rem", ~paddingRight="1rem", ()),
    "uppercaseText": Style.make(~textTransform="uppercase", ()),
  }
)
