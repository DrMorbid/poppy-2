type t = AboutUs | Registrations | References | Contact | News

module RoutePath = {
  let home = "/"
  let aboutUs = "/about-us"
  let registrations = "/registrations"
  let references = "/references"
  let contact = "/contact"
  let news = "/novinka"
}

let toRoutePath = page => {
  open RoutePath

  switch page {
  | AboutUs => aboutUs
  | Registrations => registrations
  | References => references
  | Contact => contact
  | News => news
  }
}

let toLabel = page => {
  open Message.Menu

  switch page {
  | AboutUs => aboutUs
  | Registrations => registrations
  | References => references
  | Contact => contact
  | News => news
  }
}

let menuItems = isLatestNewsRead =>
  if isLatestNewsRead {
    list{AboutUs, Registrations, References, Contact, News}
  } else {
    list{AboutUs, Registrations, References, Contact}
  }
