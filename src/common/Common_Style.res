open Mui
open ReactDOM

let headerGap = Style.make(~marginTop="2rem", ())

let useStyles: Styles.useStyles<{
  "headerGap": string,
  "paragraphGap": string,
  "bold": string,
}> = Styles.makeStyles({
  "headerGap": headerGap,
  "paragraphGap": Style.make(~gridRowGap="1rem", ()),
  "bold": Style.make(~fontWeight="bold", ()),
})
