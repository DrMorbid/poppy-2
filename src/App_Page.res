open Mui

type t = Home | Registrations | Contact

module RoutePath = {
  let home = "/"
  let registrations = "/registrations"
  let contact = "/contact"
}

let toRoutePath = page => {
  open RoutePath

  switch page {
  | Home => home
  | Registrations => registrations
  | Contact => contact
  }
}

let toLabel = page => {
  open Message.Menu

  switch page {
  | Home => home
  | Registrations => registrations
  | Contact => contact
  }
}

@react.component
let make = (~children) => {
  let commonClasses = Common.Style.useStyles(.)

  <Grid container=true className={commonClasses["pageGutters"]}>
    <Grid item=true> children </Grid>
  </Grid>
}
