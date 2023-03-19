open Mui
open Mui.Grid
open ReactDOM

let useStyles: Styles.useStyles<{
  "coloredLight": string,
  "coloredDark": string,
}> = Styles.makeStyles({
  "coloredLight": Style.make(~backgroundColor="rgba(230, 230, 230, 0.75)", ()),
  "coloredDark": Style.make(~backgroundColor="rgba(70, 70, 70, 0.75)", ()),
})

@react.component
let make = (~colored=false, ~children) => {
  let prefersDarkMode = Core.useMediaQueryString(Common_Constants.darkModeMediaQuery)
  let classes = useStyles(.)
  let commonClasses = Common_Style.useStyles(.)

  let createContainerStyling = () =>
    switch (colored, prefersDarkMode) {
    | (true, true) => `${commonClasses["pageGutters"]} ${classes["coloredDark"]}`
    | (true, false) => `${commonClasses["pageGutters"]} ${classes["coloredLight"]}`
    | (false, _) => commonClasses["pageGutters"]
    }

  <Grid item=true xs=Xs.\"12" className={createContainerStyling()}> children </Grid>
}
