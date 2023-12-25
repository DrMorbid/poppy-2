@react.component
let make = (~children) => {
  <>
    <Mui.Hidden smDown=true>
      <Mui.Grid
        container=true
        direction=Row
        justifyContent=Mui.System.Value.String("space-between")
        wrap=Nowrap>
        children
      </Mui.Grid>
    </Mui.Hidden>
    <Mui.Hidden smUp=true>
      <Mui.Grid container=true direction=Row justifyContent=Mui.System.Value.String("space-evenly")>
        children
      </Mui.Grid>
    </Mui.Hidden>
  </>
}
