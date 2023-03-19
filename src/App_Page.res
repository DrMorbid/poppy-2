open Mui
open Mui.Grid
open RescriptReactRouter

type t = Home | Registrations | Contact | QAndA | References

module RoutePath = {
  let home = "/"
  let registrations = "/registrations"
  let contact = "/contact"
  let qAndA = "/qAndA"
  let references = "/references"
}

let toRoutePath = page => {
  open RoutePath

  switch page {
  | Home => home
  | Registrations => registrations
  | Contact => contact
  | QAndA => qAndA
  | References => references
  }
}

let toLabel = page => {
  open Message.Menu

  switch page {
  | Home => home
  | Registrations => registrations
  | Contact => contact
  | QAndA => qAndA
  | References => references
  }
}

let goTo = page => push(page->toRoutePath)

let isHomePage = url => url.path->Belt.List.length == 0

@react.component
let make = (~children) => {
  let commonClasses = Common.Style.useStyles(.)

  <Grid container=true className={commonClasses["pageGutters"]}>
    <Grid item=true xs=Xs.\"12"> children </Grid>
  </Grid>
}
