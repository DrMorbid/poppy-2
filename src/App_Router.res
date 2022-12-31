@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
  | list{"registrations"} => <Registrations.Page />
  | list{"references"} => <References.Page />
  | list{"contact"} => <Contact.Page />
  | list{"about-us"} => <AboutUs.Page />
  | list{"news"} => <News.Page />
  | list{} | _ => <Home.Page />
  }
}
