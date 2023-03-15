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

type state = {
  menuItemTargets: menuItemTargets,
  topRef: option<React.ref<Js.Nullable.t<Dom.element>>>,
}

let initialState = {
  open Belt.Map

  {
    menuItemTargets: make(~id=module(MenuItem.TargetsMap))
    ->set(Home, Page(App_Page.Home))
    ->set(QAndA, Page(App_Page.QAndA))
    ->set(Contact, Page(App_Page.Contact))
    ->set(References, Page(App_Page.References)),
    topRef: None,
  }
}

type action =
  | AddMenuItemScrollableRef(MenuItem.t, React.ref<Js.Nullable.t<Dom.element>>)
  | SetTopRef(React.ref<Js.Nullable.t<Dom.element>>)

let reducer = (state, action) =>
  switch action {
  | AddMenuItemScrollableRef(menuItem, ref) => {
      ...state,
      menuItemTargets: state.menuItemTargets->Belt.Map.set(menuItem, ScrollableRef(ref)),
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
