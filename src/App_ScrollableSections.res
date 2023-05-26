open Mui.Grid

type coloredSections = Even | Odd

type section = {element: Jsx.element, topRef: React.ref<nullable<Dom.element>>, accented?: bool}

@react.component
let make = (~sections, ~coloredSections=Even, ~children=?) => {
  <Mui.Grid
    container=true direction=#column alignItems=#stretch className=Common.Style.islandsVerticalGap>
    {<>
      {sections
      ->List.mapWithIndex((index, {element, topRef, ?accented}) =>
        <App_ScrollableSection
          coloring={if accented->Option.getWithDefault(false) {
            Accented
          } else {
            switch (coloredSections, index->mod(2) == 0) {
            | (Even, true) | (Odd, false) => Colored
            | (Odd, true) | (Even, false) => Transparent
            }
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
