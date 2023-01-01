module Options = {
  type t = {disableHysteresis: option<bool>, target: option<React.element>, threshold: option<int>}
  let make = (~disableHysteresis=?, ~target=?, ~threshold=?, ()) => {
    disableHysteresis,
    target,
    threshold,
  }
}

@module("@material-ui/core/useScrollTrigger")
external useScrollTrigger: Options.t => bool = "default"

type scrollOptions = {
  behavior: [#auto | #smooth],
  block: [#start | #center | #end | #nearest],
  inline: [#start | #center | #end | #nearest],
}

@send external scrollIntoView: (Dom.element, scrollOptions) => unit = "scrollIntoView"
