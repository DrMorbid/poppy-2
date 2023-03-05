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

type state = {
  activeMenuItem: App_Page.t,
  latestNewsClosed: bool,
  menutItemTopRefs: Belt.Map.t<
    App_Types.MenuItemsTopRefsMap.t,
    React.ref<Js.Nullable.t<Dom.element>>,
    App_Types.MenuItemsTopRefsMap.identity,
  >,
}

let initialState = {
  activeMenuItem: Home,
  latestNewsClosed: false,
  menutItemTopRefs: Belt.Map.make(~id=module(App_Types.MenuItemsTopRefsMap)),
}

type action =
  | StoreActiveMenuItem(App_Page.t)
  | LatestNewsClosed
  | AddMenuItemTopRef(App_Types.homeSection, React.ref<Js.Nullable.t<Dom.element>>)

let reducer = (state, action) =>
  switch action {
  | StoreActiveMenuItem(activeMenuItem) => {...state, activeMenuItem}
  | LatestNewsClosed => {...state, latestNewsClosed: true}
  | AddMenuItemTopRef(homeSection, ref) => {
      ...state,
      menutItemTopRefs: state.menutItemTopRefs->Belt.Map.set(homeSection, ref),
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
