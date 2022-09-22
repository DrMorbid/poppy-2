open Mui
open ReactDOM

let headerGap = Style.make(~marginTop="2rem", ())

let useStyles: Styles.useStyles<{
  "headerGap": string,
  "paragraphGap": string,
  "bold": string,
  "marginBottomSm": string,
  "marginBottom": string,
  "fullWidth": string,
}> = Styles.makeStyles({
  "headerGap": headerGap,
  "paragraphGap": Style.make(~gridRowGap="1rem", ()),
  "bold": Style.make(~fontWeight="bold", ()),
  "marginBottomSm": Style.make(~marginBottom="0.75rem", ()),
  "marginBottom": Style.make(~marginBottom="1rem", ()),
  "fullWidth": Style.make(~width="100%", ()),
})
