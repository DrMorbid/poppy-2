module type Config = {
  type context
  let defaultValue: context
}

module Make = (Config: Config) => {
  let t = React.createContext(Config.defaultValue)

  module Provider = {
    let make = React.Context.provider(t)

    @obj
    external makeProps: (
      ~value: Config.context,
      ~children: React.element,
      ~key: string=?,
      unit,
    ) => {"value": Config.context, "children": React.element} = ""
  }
}

type state = {activeMenuItem: App_Page.t}

let initialState = {
  activeMenuItem: App_Page.menuItems()->Belt.List.head->Belt.Option.getExn,
}

type action = StoreActiveMenuItem(App_Page.t)

let reducer = (_state, action) => {
  switch action {
  | StoreActiveMenuItem(activeMenuItem) => {activeMenuItem: activeMenuItem}
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
