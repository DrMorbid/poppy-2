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

let isHomePage = url => url.path->List.length == 0

let isRegistrationsPage = url =>
  url.path
  ->List.head
  ->Option.filter(path => path == RoutePath.registrations->String.substringToEnd(~start=1))
  ->Option.isSome

type gutters = Top | Complete

@react.component
let make = (~gutters=Complete, ~children) => {
  let theme = Mui.Core.useTheme()

  <Mui.Grid
    container=true
    className={switch gutters {
    | Top => Common.Style.pageGuttersTop(theme)
    | Complete => Common.Style.pageGuttersComplete(theme)
    }}>
    <Mui.Grid item=true xs=Xs.\"12"> children </Mui.Grid>
  </Mui.Grid>
}
