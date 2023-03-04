open Mui
open Mui.Grid
open ReactDOM

type t = LatestNews | AboutUs | References | Contact

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
  "coloredDark": string,
  "coloredLight": string,
}> = Styles.makeStylesWithTheme(theme =>
  {
    "coloredDark": Style.make(~backgroundColor=theme.palette.grey.\"800", ()),
    "coloredLight": Style.make(~backgroundColor=theme.palette.grey.\"200", ()),
  }
)

@react.component
let make = (~colored=false, ~anchor as id, ~children) => {
  let prefersDarkTheme = Mui.Core.useMediaQueryString("(prefers-color-scheme: dark)")
  let classes = useStyles(.)
  let commonClasses = Common.Style.useStyles(.)

  let createContainerStyling = () =>
    switch (colored, prefersDarkTheme) {
    | (true, true) => `${commonClasses["pageGutters"]} ${classes["coloredDark"]}`
    | (true, false) => `${commonClasses["pageGutters"]} ${classes["coloredLight"]}`
    | (false, _) => commonClasses["pageGutters"]
    }

  <Grid item=true>
    <Grid container=true>
      {if colored {
        <Grid item=true xs=Xs.\"12">
          <Divider />
        </Grid>
      } else {
        React.null
      }}
      <Grid item=true xs=Xs.\"12" id className={createContainerStyling()}> children </Grid>
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
