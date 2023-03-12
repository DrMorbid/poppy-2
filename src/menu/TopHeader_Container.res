open Mui

@react.component
let make = (~children) => {
  <>
    <Hidden xsDown=true>
      <Grid container=true direction=#row justify=#"space-between" wrap=#nowrap> children </Grid>
    </Hidden>
    <Hidden smUp=true>
      <Grid container=true direction=#row justify=#"space-evenly"> children </Grid>
    </Hidden>
  </>
}
