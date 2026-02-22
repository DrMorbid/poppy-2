open Utils.Style

module Classes = {
  let backgroundImage = prefersDarkMode =>
    {
      JsxDOMStyle.backgroundImage: "url(/header_bg.webp)",
      backgroundPosition: "center",
      backgroundSize: "cover",
      backgroundColor: prefersDarkMode ? "black" : "white",
      backgroundRepeat: "no-repeat",
    }->styleToSx
  let buttonsGap = {gridRowGap: "1rem"}->styleToSx
}

@react.component
let make = (~children) => {
  let isMdUp = Mui.Core.useMediaQueryString(App_Theme.Breakpoint.mdUp)
  let prefersDarkMode = Mui.Core.useMediaQueryString(Common.Constants.darkModeMediaQuery)

  <>
    <Mui.Hidden smDown=true>
      <Mui.Grid
        container=true
        direction=Row
        justifyContent=Mui.System.Value.String("space-between")
        wrap=Nowrap
        sx=?{isMdUp ? Some(Classes.backgroundImage(prefersDarkMode)) : None}
      >
        children
      </Mui.Grid>
    </Mui.Hidden>
    <Mui.Hidden smUp=true>
      <Mui.Grid
        container=true
        direction=Row
        justifyContent=Mui.System.Value.String("space-evenly")
        sx=Classes.buttonsGap
      >
        children
      </Mui.Grid>
    </Mui.Hidden>
  </>
}
