open ReactDOM
open Utils.Style

let pagePaddingXs = "1rem"
let pagePaddingSm = "2rem"
let pagePaddingMdUp = "3rem"

let headerGap = Mui.Sx.obj({marginTop: String("2rem")})
let paragraphGap: Style.t = {gridRowGap: "1rem"}
let sectionGap = {gridRowGap: "2rem"}->styleToSx
let bold: Mui.System.props = {fontWeight: String("bold")}
let italic: Mui.System.props = {fontStyle: String("italic")}
let marginTopSm = Mui.Sx.obj({marginTop: String("0.75rem")})
let marginBottomSm = Mui.Sx.obj({marginBottom: String("0.75rem")})
let marginBottom = Mui.Sx.Array.obj({marginBottom: String("1rem")})
let fullWidth = Mui.Sx.obj({width: String("100%")})
let centeredText = Mui.Sx.Array.obj({textAlign: String("center")})
let pageGuttersTop = Mui.Sx.Array.obj({
  paddingTop: Breakpoint({
    xs: String(pagePaddingXs),
    sm: String(pagePaddingSm),
    md: String(pagePaddingMdUp),
  }),
})
let pageGuttersComplete = Mui.Sx.Array.obj({
  padding: Breakpoint({
    xs: String(pagePaddingXs),
    sm: String(pagePaddingSm),
    md: String(pagePaddingMdUp),
  }),
})
let islandsVerticalGap = {gridRowGap: "2rem"}->styleToSx
let islandsHorizontalGap = Mui.Sx.obj({paddingLeft: String("1rem"), paddingRight: String("1rem")})
let uppercaseText = {textTransform: "uppercase"}->styleToSx
let largeButtonLabel = Mui.Sx.obj({
  fontSize: String(App_Theme.Typography.h5.fontSize),
  fontWeight: String(App_Theme.Typography.h5.fontWeight),
  lineHeight: Number(1.334),
})

let combineTextStyles = (~bold as boldText=false, ~italic as italicText=false) => {
  let bold = boldText ? [bold->Mui.Sx.Array.obj] : []
  let italic = italicText ? [italic->Mui.Sx.Array.obj] : []

  bold
  ->Array.concat(italic)
  ->Mui.Sx.array
}

let appContainer = Mui.Sx.array([
  Mui.Sx.Array.obj({
    paddingTop: Breakpoint({xs: String("1rem"), sm: String("1.5rem"), md: String("2rem")}),
    paddingLeft: Breakpoint({xs: String("0rem"), sm: String("1.5rem"), md: String("2rem")}),
    paddingRight: Breakpoint({xs: String("0rem"), sm: String("1.5rem"), md: String("2rem")}),
  }),
  Mui.Sx.Array.func(theme =>
    Mui.Sx.Array.obj({
      bgcolor: theme["palette"]["mode"]->App_Theme.Colors.isLightMode
        ? String("rgba(250, 250, 250, 0.8)")
        : String("rgba(48, 48, 48, 0.8)"),
    })
  ),
])
