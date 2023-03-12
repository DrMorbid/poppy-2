let goTo = page => {
  RescriptReactRouter.push(page->App_Page.toRoutePath)
}

@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
  | list{"registrations"} => <Registrations.Page />
  | list{"contact"} => <Contact.Page />
  | list{} | _ => <Home.Page />
  }
}
