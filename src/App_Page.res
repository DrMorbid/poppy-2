open Mui

type t = Home | Registrations | Contact | QAndA

module RoutePath = {
  let home = "/"
  let registrations = "/registrations"
  let contact = "/contact"
  let qAndA = "/qAndA"
}

let toRoutePath = page => {
  open RoutePath

  switch page {
  | Home => home
  | Registrations => registrations
  | Contact => contact
  | QAndA => qAndA
  }
}

let toLabel = page => {
  open Message.Menu

  switch page {
  | Home => home
  | Registrations => registrations
  | Contact => contact
  | QAndA => qAndA
  }
}

@react.component
let make = (~children) => {
  let commonClasses = Common.Style.useStyles(.)

  <Grid container=true className={commonClasses["pageGutters"]}>
    <Grid item=true> children </Grid>
  </Grid>
}
