type t = Home | AboutUs | Registrations | References | Contact | News

module RoutePath = {
  let home = "/"
  let aboutUs = "/about-us"
  let registrations = "/registrations"
  let references = "/references"
  let contact = "/contact"
  let news = "/news"
}

let toRoutePath = page => {
  open RoutePath

  switch page {
  | Home => home
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
  | Home => home
  | AboutUs => aboutUs
  | Registrations => registrations
  | References => references
  | Contact => contact
  | News => news
  }
}

let menuItems = isLatestNewsRead =>
  if isLatestNewsRead {
    list{Home, AboutUs, News, Registrations, References, Contact}
  } else {
    list{Home, AboutUs, Registrations, References, Contact}
  }
