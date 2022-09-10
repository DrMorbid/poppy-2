open Mui

module Theme = App_Theme
module Context = App_Context
module Actions = App_Actions
module Page = App_Page
module Router = App_Router
module Icon = App_Icon

@react.component
let make = () => {
  <>
    <TopMenu />
    <Container>
      <Router />
    </Container>
  </>
}
