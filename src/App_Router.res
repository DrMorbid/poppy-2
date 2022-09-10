@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
  | list{"registrations"} => <Registrations.Page />
  | list{"references"} => <References.Page />
  | list{"contact"} => <Contact.Page />
  | list{"about-us"} => <AboutUs.Page />
  | list{} | _ => {
      RescriptReactRouter.push(App_Page.AboutUs->App_Page.toRoutePath)
      <AboutUs.Page />
    }
  }
}
