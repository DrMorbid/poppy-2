open Utils.Style

module Classes = {
  let backgroundImage = {
    JsxDOMStyle.background: "url(/header_bg.webp)",
    backgroundPosition: "center",
    backgroundSize: "contain",
    backgroundColor: "white",
  }->styleToSx
}

@react.component
let make = (~children) => {
  let isMdUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.mdUp)

  <>
    <Mui.Hidden smDown=true>
      <Mui.Grid
        container=true
        direction=Row
        justifyContent=Mui.System.Value.String("space-between")
        wrap=Nowrap
        sx=?{isMdUp ? Some(Classes.backgroundImage) : None}>
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
