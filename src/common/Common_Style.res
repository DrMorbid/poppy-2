open ReactDOM
open Utils.Style

let pagePaddingXs = "1rem"
let pagePaddingSm = "2rem"
let pagePaddingMdUp = "3rem"

let headerGap = Mui.Sx.obj({marginTop: String("2rem")})
let paragraphGap: Style.t = {gridRowGap: "1rem"}
let sectionGap = {gridRowGap: "2rem"}->styleToSx
let bold: Mui.System.props = {fontWeight: String("bold")}
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
