// TODO: Don't like this carousel. Seems dead. Watch one for newer and better and idealy directly inside of MUI.

@react.component @module("react-material-ui-carousel")
external make: (
  ~autoPlay: bool=?,
  ~indicators: bool=?,
  ~animation: [#fade | #slide]=?,
  ~children: array<React.element>,
  ~className: string=?,
  ~id: string=?,
  ~style: ReactDOM.Style.t=?,
  ~key: string=?,
  ~ref: ReactDOM.domRef=?,
) => React.element = "default"
