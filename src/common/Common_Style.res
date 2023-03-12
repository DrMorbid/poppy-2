open Mui
open ReactDOM
open Utils.Style

let headerGap = Style.make(~marginTop="2rem", ())

let useStyles: Styles.useStyles<{
  "headerGap": string,
  "paragraphGap": string,
  "bold": string,
  "marginTopSm": string,
  "marginBottomSm": string,
  "marginBottom": string,
  "fullWidth": string,
  "centeredText": string,
  "pageGutters": string,
}> = Styles.makeStylesWithTheme(theme =>
  {
    "headerGap": headerGap,
    "paragraphGap": Style.make(~gridRowGap="1rem", ()),
    "bold": Style.make(~fontWeight="bold !important", ()),
    "marginTopSm": Style.make(~marginTop="0.75rem", ()),
    "marginBottomSm": Style.make(~marginBottom="0.75rem", ()),
    "marginBottom": Style.make(~marginBottom="1rem", ()),
    "fullWidth": Style.make(~width="100%", ()),
    "centeredText": Style.make(~textAlign="center", ()),
    "pageGutters": list{
      Style.make(~padding="3rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("sm"),
      ),
      Style.make(~padding="2rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.up->Any.unsafeGetValue("xs"),
      ),
      Style.make(~padding="1rem", ())->styleWithMediaQuery(
        ~mediaQuery=theme.breakpoints.down->Any.unsafeGetValue("xs"),
      ),
    }->stylesCombiner,
  }
)
