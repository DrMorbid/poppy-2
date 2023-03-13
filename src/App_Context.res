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

type menuItemTarget = ScrollableRef(React.ref<Js.Nullable.t<Dom.element>>) | Page(App_Page.t)

type menuItemTargets = Belt.Map.t<
  MenuItem.TargetsMap.t,
  menuItemTarget,
  MenuItem.TargetsMap.identity,
>

type state = {menuItemTargets: menuItemTargets}

let initialState = {
  menuItemTargets: Belt.Map.make(~id=module(MenuItem.TargetsMap))
  ->Belt.Map.set(Home, Page(App_Page.Home))
  ->Belt.Map.set(QAndA, Page(App_Page.QAndA))
  ->Belt.Map.set(Contact, Page(App_Page.Contact)),
}

type action = AddMenuItemScrollableRef(MenuItem.t, React.ref<Js.Nullable.t<Dom.element>>)

let reducer = (state, action) =>
  switch action {
  | AddMenuItemScrollableRef(menuItem, ref) => {
      menuItemTargets: state.menuItemTargets->Belt.Map.set(menuItem, ScrollableRef(ref)),
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
