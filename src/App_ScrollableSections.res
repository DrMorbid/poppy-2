open Mui.Grid

type coloredSections = Even | Odd

type section = {element: Jsx.element, topRef: React.ref<nullable<Dom.element>>}

@react.component
let make = (~sections, ~coloredSections=Even, ~children=?) => {
  <Mui.Grid
    container=true direction=#column alignItems=#stretch className=Common.Style.islandsVerticalGap>
    {<>
      {sections
      ->List.mapWithIndex((index, {element, topRef}) =>
        <App_ScrollableSection
          colored={switch (coloredSections, index->mod(2) == 0) {
          | (Even, true) | (Odd, false) => true
          | (Odd, true) | (Even, false) => false
          }}
          topRef
          key={`scrollable-section-${index->Int.toString}`}>
          element
        </App_ScrollableSection>
      )
      ->List.toArray
      ->React.array}
      {children->Option.getWithDefault(React.null)}
    </>}
  </Mui.Grid>
}
