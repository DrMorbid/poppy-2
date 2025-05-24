open App_Types

module type Config = {
  type context
  let defaultValue: context
}

module Make = (Config: Config) => {
  let t = React.createContext(Config.defaultValue)

  module Provider = {
    let make = React.Context.provider(t)
  }
}

type menuItemTarget =
  ScrollableRef(React.ref<Nullable.t<Dom.element>>) | Page(App_Page.t) | ExternalUrl(string)

type menuItemTargets = Map.t<MenuItem.t, menuItemTarget>

type alert = Common.Alert.Type.t<{"error": string}>

type state = {
  homeMenuItemTargets: menuItemTargets,
  registrationsMenuItemTargets: menuItemTargets,
  topRef: option<React.ref<Nullable.t<Dom.element>>>,
  alert: option<alert>,
}

let initialState = {
  open MenuItem

  let homeMenuItemTargets = Map.make()
  homeMenuItemTargets->Map.set(Home, Page(App_Page.Home))
  homeMenuItemTargets->Map.set(QAndA, Page(App_Page.QAndA))
  homeMenuItemTargets->Map.set(Contact, Page(App_Page.Contact))
  homeMenuItemTargets->Map.set(References, Page(App_Page.References))
  homeMenuItemTargets->Map.set(Filmak, ExternalUrl("https://www.filmak.eu/"))

  let registrationsMenuItemTargets = Map.make()
  registrationsMenuItemTargets->Map.set(Home, Page(App_Page.Home))

  {
    homeMenuItemTargets,
    registrationsMenuItemTargets,
    topRef: None,
    alert: None,
  }
}

type action =
  | AddHomeMenuItemScrollableRef(MenuItem.t, React.ref<Nullable.t<Dom.element>>)
  | AddRegistrationsMenuItemScrollableRef(MenuItem.t, React.ref<Nullable.t<Dom.element>>)
  | SetTopRef(React.ref<Nullable.t<Dom.element>>)
  | ShowAlert(alert)
  | HideAlert

let reducer = (state, action) =>
  switch action {
  | AddHomeMenuItemScrollableRef(menuItem, ref) => {
      ...state,
      homeMenuItemTargets: {
        state.homeMenuItemTargets->Map.set(menuItem, ScrollableRef(ref))

        state.homeMenuItemTargets
      },
    }
  | AddRegistrationsMenuItemScrollableRef(menuItem, ref) => {
      ...state,
      registrationsMenuItemTargets: {
        state.registrationsMenuItemTargets->Map.set(menuItem, ScrollableRef(ref))

        state.registrationsMenuItemTargets
      },
    }
  | SetTopRef(topRef) => {
      ...state,
      topRef: Some(topRef),
    }
  | ShowAlert(alert) => {
      ...state,
      alert: Some(alert),
    }
  | HideAlert => {
      ...state,
      alert: None,
    }
  }

module Context = {
  include Make({
    type context = (state, action => unit)
    let defaultValue = (initialState, _ => ())
  })
}

module Provider = {
  @react.component
  let make = (~children) => {
    let (state, dispatch) = React.useReducer(reducer, initialState)

    <Context.Provider value=(state, dispatch)> children </Context.Provider>
  }
}
