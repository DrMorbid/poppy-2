open Mui
open Mui.Grid
open ReactDOM

@react.component
let make = (~coloring: Common.Section.coloring=Transparent, ~children, ~topRef) => {
  <Grid item=true ref={topRef->Ref.domRef}>
    <Grid container=true>
      {switch coloring {
      | Colored | Accented =>
        <Grid item=true xs=Xs.\"12">
          <Divider />
        </Grid>
      | Transparent => React.null
      }}
      <Common.Section coloring> {children} </Common.Section>
      {switch coloring {
      | Colored | Accented =>
        <Grid item=true xs=Xs.\"12">
          <Divider />
        </Grid>
      | Transparent => React.null
      }}
    </Grid>
  </Grid>
}
