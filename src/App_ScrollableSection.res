open Mui
open Mui.Grid
open ReactDOM

@react.component
let make = (~colored=false, ~children, ~topRef) => {
  <Grid item=true ref={topRef->Ref.domRef}>
    <Grid container=true>
      {if colored {
        <Grid item=true xs=Xs.\"12">
          <Divider />
        </Grid>
      } else {
        React.null
      }}
      <Common.Section colored> {children} </Common.Section>
      {if colored {
        <Grid item=true xs=Xs.\"12">
          <Divider />
        </Grid>
      } else {
        React.null
      }}
    </Grid>
  </Grid>
}
