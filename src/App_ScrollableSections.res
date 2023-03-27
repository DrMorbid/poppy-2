open Mui
open Mui.Grid

type coloredSections = Even | Odd

type section = {element: Jsx.element, topRef: React.ref<Js.nullable<Dom.element>>}

@react.component
let make = (~sections, ~coloredSections=Even, ~children=?) => {
  <Grid
    container=true direction=#column alignItems=#stretch className=Common.Style.islandsVerticalGap>
    {<>
      {sections
      ->Belt.List.mapWithIndex((index, {element, topRef}) =>
        <App_ScrollableSection
          colored={switch (coloredSections, index->mod(2) == 0) {
          | (Even, true) | (Odd, false) => true
          | (Odd, true) | (Even, false) => false
          }}
          topRef
          key={`scrollable-section-${index->Belt.Int.toString}`}>
          element
        </App_ScrollableSection>
      )
      ->Belt.List.toArray
      ->React.array}
      {children->Belt.Option.getWithDefault(React.null)}
    </>}
  </Grid>
}
