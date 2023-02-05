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

type state = {activeMenuItem: App_Page.t, latestNewsClosed: bool}

let initialState = {
  activeMenuItem: Home,
  latestNewsClosed: false,
}

type action = StoreActiveMenuItem(App_Page.t) | LatestNewsClosed

let reducer = (state, action) =>
  switch action {
  | StoreActiveMenuItem(activeMenuItem) => {...state, activeMenuItem}
  | LatestNewsClosed => {...state, latestNewsClosed: true}
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
