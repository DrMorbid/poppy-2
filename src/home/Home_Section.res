open Mui
open Mui.Grid
open ReactDOM
open App_Types

let toLabel = page => {
  open Message.Menu

  switch page {
  | LatestNews => news
  | AboutUs => aboutUs
  | References => references
  | Contact => contact
  }
}

let useStyles: Styles.useStyles<{
  "coloredLight": string,
  "coloredDark": string,
}> = Styles.makeStyles({
  "coloredLight": Style.make(~backgroundColor="rgba(240, 240, 240, 0.75)", ()),
  "coloredDark": Style.make(~backgroundColor="rgba(70, 70, 70, 0.75)", ()),
})

@react.component
let make = (~colored=false, ~children, ~topRef) => {
  let prefersDarkTheme = Core.useMediaQueryString("(prefers-color-scheme: dark)")
  let classes = useStyles(.)
  let commonClasses = Common.Style.useStyles(.)

  let createContainerStyling = () =>
    switch (colored, prefersDarkTheme) {
    | (true, true) => `${commonClasses["pageGutters"]} ${classes["coloredDark"]}`
    | (true, false) => `${commonClasses["pageGutters"]} ${classes["coloredLight"]}`
    | (false, _) => commonClasses["pageGutters"]
    }

  <Grid item=true ref={topRef->Ref.domRef}>
    <Grid container=true>
      {if colored {
        <Grid item=true xs=Xs.\"12">
          <Divider />
        </Grid>
      } else {
        React.null
      }}
      <Grid item=true xs=Xs.\"12" className={createContainerStyling()}> children </Grid>
      {if colored {
        <Grid item=true xs=Xs.\"12">
          <Divider />
        </Grid>
      } else {
        React.null
      }}
    </Grid>
  </Grid>
}
