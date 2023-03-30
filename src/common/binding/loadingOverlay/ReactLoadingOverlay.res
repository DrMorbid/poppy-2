type styles = {
  wrapper?: Dict.t<string>,
  overlay?: Dict.t<string> => Dict.t<string>,
  content?: Dict.t<string> => Dict.t<string>,
  spinner?: Dict.t<string> => Dict.t<string>,
}

@react.component @module("react-loading-overlay")
external make: (
  ~active: bool=?,
  ~fadeSpeed: int=?,
  ~onClick: ReactEvent.Synthetic.t => unit=?,
  ~spinner: React.element=?,
  ~text: React.element=?,
  ~children: React.element=?,
  ~className: string=?,
  ~classNamePrefix: string=?,
  ~id: string=?,
  ~style: ReactDOM.Style.t=?,
  ~styles: styles=?,
  ~key: string=?,
  ~ref: ReactDOM.domRef=?,
) => React.element = "default"
