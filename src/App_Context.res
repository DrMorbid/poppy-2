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
  menutItemTopRefs: Belt.Map.t<
    App_Types.MenuItemsTopRefsMap.t,
    React.ref<Js.Nullable.t<Dom.element>>,
    App_Types.MenuItemsTopRefsMap.identity,
  >,
}

let initialState = {
  menutItemTopRefs: Belt.Map.make(~id=module(App_Types.MenuItemsTopRefsMap)),
}

type action = AddMenuItemTopRef(App_Types.homeSection, React.ref<Js.Nullable.t<Dom.element>>)

let reducer = (state, action) =>
  switch action {
  | AddMenuItemTopRef(homeSection, ref) => {
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
