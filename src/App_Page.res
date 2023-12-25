type t = Home | Registrations | Contact | QAndA | References | EmailUs

module RoutePath = {
  let home = "/"
  let registrations = "/registrations"
  let contact = "/contact"
  let qAndA = "/qAndA"
  let references = "/references"
  let emailUs = "/emailUs"
}

let toRoutePath = page => {
  open RoutePath

  switch page {
  | Home => home
  | Registrations => registrations
  | Contact => contact
  | QAndA => qAndA
  | References => references
  | EmailUs => emailUs
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
  | EmailUs => emailUs
  }
}

let goTo = (router, page) => router->Next.Navigation.Router.push(page->toRoutePath)

let isHomePage = pathname => pathname->String.equal(RoutePath.home)

let isRegistrationsPage = pathname => pathname->String.equal(RoutePath.registrations)

type gutters = Top | Complete

@react.component
let make = (~gutters=Complete, ~children) => {
  <Mui.Grid
    container=true
    className={switch gutters {
    | Top => Common.Style.pageGuttersTop
    | Complete => Common.Style.pageGuttersComplete
    }}>
    <Mui.Grid item=true xs=Number(12)> children </Mui.Grid>
  </Mui.Grid>
}
