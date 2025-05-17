module Classes = {
  let coloredBackground = Mui.Sx.Array.func(theme =>
    Mui.Sx.Array.obj({
      bgcolor: String(
        App_Theme.Colors.palette(
          !(theme["palette"]["mode"]->App_Theme.Colors.isLightMode),
        )["secondaryLight"]->Utils.Style.mixColors(
          ~with=theme["palette"]["mode"]->App_Theme.Colors.isLightMode
            ? Mui.Colors.grey["50"]
            : Mui.Colors.grey["900"],
          ~transparency1=#background,
          ~transparency2=#background,
          ~percentage1=25,
          ~percentage2=75,
        ),
      ),
    })
  )
  let accentedBackgroundYellow = Mui.Sx.Array.func(theme =>
    Mui.Sx.Array.obj({
      bgcolor: String(
        App_Theme.Colors.palette(
          !(theme["palette"]["mode"]->App_Theme.Colors.isLightMode),
        )["secondaryLight"]->App_Theme.Transparency.addTransparency(#background),
      ),
    })
  )
  let accentedBackgroundGreen = Mui.Sx.Array.func(theme =>
    Mui.Sx.Array.obj({
      bgcolor: String(
        App_Theme.Colors.palette(
          !(theme["palette"]["mode"]->App_Theme.Colors.isLightMode),
        )["success"]->App_Theme.Transparency.addTransparency(#background),
      ),
    })
  )
}

type accented = Yellow | Green

type coloring = Transparent | Colored | Accented(accented)

@react.component
let make = (~coloring=Transparent, ~children) => {
  let createContainerStyling = () =>
    switch coloring {
    | Colored => [Common_Style.pageGuttersComplete, Classes.coloredBackground]
    | Accented(Yellow) => [Common_Style.pageGuttersComplete, Classes.accentedBackgroundYellow]
    | Accented(Green) => [Common_Style.pageGuttersComplete, Classes.accentedBackgroundGreen]
    | Transparent => [Common_Style.pageGuttersComplete]
    }->Mui.Sx.array

  <Mui.Grid item=true xs=Number(12) sx={createContainerStyling()}> children </Mui.Grid>
}
