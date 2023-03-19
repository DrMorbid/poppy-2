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
  let commonClasses = Common_Style.useStyles(.)

  <Grid
    item=true
    xs
    sm
    md
    lg
    xl
    className=?{disableGutters->Belt.Option.getWithDefault(false)
      ? None
      : Some(commonClasses["islandsHorizontalGap"])}>
    <Common_Text ?header ?headerVariant body ?centerAll />
  </Grid>
}
