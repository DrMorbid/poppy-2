type t = Home | Registrations

module RoutePath = {
  let home = "/"
  let registrations = "/registrations"
}

let toRoutePath = page => {
  open RoutePath

  switch page {
  | Home => home
  | Registrations => registrations
  }
}

let toLabel = page => {
  open Message.Menu

  switch page {
  | Home => home
  | Registrations => registrations
  }
}
