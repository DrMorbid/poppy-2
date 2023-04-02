open Mui
open Mui.Grid

@react.component
let make = (
  ~header=?,
  ~headerVariant=?,
  ~body,
  ~centerAll=?,
  ~disableGutters=?,
  ~xs=Xs.\"12",
  ~sm=Sm.\"6",
  ~md=Md.\"4",
  ~lg=Lg.\"3",
  ~xl=Xl.\"true",
) => {
  <Grid
    item=true
    xs
    sm
    md
    lg
    xl
    className=?{disableGutters->Option.getWithDefault(false)
      ? None
      : Some(Common_Style.islandsHorizontalGap)}>
    <Common_Text ?header ?headerVariant body ?centerAll />
  </Grid>
}
