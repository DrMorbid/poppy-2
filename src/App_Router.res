@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
  | list{"registrations"} => <Registrations.Page />
  | list{} | _ => <Home.Page />
  }
}
