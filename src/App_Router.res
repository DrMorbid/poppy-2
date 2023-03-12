open RescriptReactRouter

let goTo = page => push(page->App_Page.toRoutePath)

let isHomePage = url => url.path->Belt.List.length == 0

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
  | list{} | _ => <Home.Page />
  }
}
