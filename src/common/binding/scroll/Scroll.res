type options = {disableHysteresis?: bool, target?: React.element, threshold?: int}

@module("@mui/material/useScrollTrigger")
external useScrollTrigger: options => bool = "default"

type scrollOptions = {
  behavior: [#auto | #smooth],
  block: [#start | #center | #end | #nearest],
  inline: [#start | #center | #end | #nearest],
}
let makeScrollOptions = (~block=#start, ~inline=#nearest, ~behavior=#smooth, ()): scrollOptions => {
  {
    block,
    inline,
    behavior,
  }
}

@send external scrollIntoView: (Dom.element, scrollOptions) => unit = "scrollIntoView"
