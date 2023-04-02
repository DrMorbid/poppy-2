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

type menuItemTarget = ScrollableRef(React.ref<Nullable.t<Dom.element>>) | Page(App_Page.t)

type menuItemTargets = Map.t<MenuItem.t, menuItemTarget>

type state = {
  homeMenuItemTargets: menuItemTargets,
  registrationsMenuItemTargets: menuItemTargets,
  topRef: option<React.ref<Nullable.t<Dom.element>>>,
}

let initialState = {
  open MenuItem

  let homeMenuItemTargets = Map.make()
  homeMenuItemTargets->Map.set(Home, Page(App_Page.Home))
  homeMenuItemTargets->Map.set(QAndA, Page(App_Page.QAndA))
  homeMenuItemTargets->Map.set(Contact, Page(App_Page.Contact))
  homeMenuItemTargets->Map.set(References, Page(App_Page.References))

  let registrationsMenuItemTargets = Map.make()
  registrationsMenuItemTargets->Map.set(Home, Page(App_Page.Home))

  {
    homeMenuItemTargets,
    registrationsMenuItemTargets,
    topRef: None,
  }
}

type action =
  | AddHomeMenuItemScrollableRef(MenuItem.t, React.ref<Nullable.t<Dom.element>>)
  | AddRegistrationsMenuItemScrollableRef(MenuItem.t, React.ref<Nullable.t<Dom.element>>)
  | SetTopRef(React.ref<Nullable.t<Dom.element>>)

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
