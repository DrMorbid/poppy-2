open Mui
open Message.Menu

@react.component
let make = () => {
  <Grid container=true direction=#column alignItems=#center>
    <Grid item=true>
      <Common.Button.WithIcon label=emailUs />
    </Grid>
  </Grid>
}
