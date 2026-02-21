@react.component
let make = (~children, ~centered=?) => {
  <Mui.Grid
    item=true
    xs=Number(12)
    sx=?{centered->Option.getOr(false) ? Some([Common_Style.centeredText]->Mui.Sx.array) : None}
  >
    children
  </Mui.Grid>
}
