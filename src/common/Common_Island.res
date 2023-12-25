@react.component
let make = (
  ~header=?,
  ~headerVariant=?,
  ~body,
  ~centerAll=?,
  ~disableGutters=?,
  ~xs=Mui.Grid.Number(12),
  ~sm=Mui.Grid.Number(6),
  ~md=Mui.Grid.Number(4),
  ~lg=Mui.Grid.Number(3),
  ~xl=Mui.Grid.True,
) => {
  <Mui.Grid
    item=true
    xs
    sm
    md
    lg
    xl
    className=?{disableGutters->Option.getOr(false)
      ? None
      : Some(Common_Style.islandsHorizontalGap)}>
    <Common_Text ?header ?headerVariant body ?centerAll />
  </Mui.Grid>
}
