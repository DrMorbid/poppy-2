open Mui
open ReactDOM

let useStyles: Styles.useStyles<{
  "xsItemGap": string,
}> = Styles.makeStyles({
  "xsItemGap": Style.make(~gridRowGap="1rem", ()),
})

@react.component
let make = (~children) => {
  let classes = useStyles(.)

  <>
    <Hidden xsDown=true>
      <Grid container=true direction=#row justify=#"space-between" wrap=#nowrap> children </Grid>
    </Hidden>
    <Hidden smUp=true>
      <Grid container=true direction=#column alignItems=#center className={classes["xsItemGap"]}>
        children
      </Grid>
    </Hidden>
  </>
}
