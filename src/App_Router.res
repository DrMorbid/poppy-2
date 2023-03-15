open RescriptReactRouter

@react.component
let make = () => {
  let url = useUrl()

  switch url.path {
  | list{"registrations"} =>
    <App_Page>
      <Registrations.Page />
    </App_Page>
  | list{"contact"} =>
    <App_Page>
      <Contact.Page />
    </App_Page>
  | list{"qAndA"} =>
    <App_Page>
      <QAndA.Page />
    </App_Page>
  | list{"references"} =>
    <App_Page>
      <References.Page />
    </App_Page>
  | list{} | _ => <Home.Page />
  }
}
