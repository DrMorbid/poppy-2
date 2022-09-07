type t = AboutUs | Registrations | References | Contact

module RoutePath = {
  let home = "/"
  let aboutUs = "/about-us"
  let registrations = "/registrations"
  let references = "/references"
  let contact = "/contact"
}

let toRoutePath = page => {
  open RoutePath

  switch page {
  | AboutUs => aboutUs
  | Registrations => registrations
  | References => references
  | Contact => contact
  }
}

let toLabel = page => {
  open Message.Menu

  switch page {
  | AboutUs => aboutUs
  | Registrations => registrations
  | References => references
  | Contact => contact
  }
}

let menuItems = () => list{AboutUs, Registrations, References, Contact}
