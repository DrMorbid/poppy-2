type coloredSections = Even | Odd

type section = {
  element: Jsx.element,
  topRef: React.ref<nullable<Dom.element>>,
  accented?: Common.Section.accented,
}

@react.component
let make = (~sections, ~coloredSections=Even, ~children=?) => {
  <Mui.Grid
    container=true direction=Column alignItems=Stretch className=Common.Style.islandsVerticalGap>
    {<>
      {sections
      ->List.mapWithIndex((index, {element, topRef, ?accented}) =>
        <App_ScrollableSection
          coloring={switch accented {
          | Some(Yellow) => Accented(Yellow)
          | Some(Green) => Accented(Green)
          | None =>
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
      {children->Option.getOr(React.null)}
    </>}
  </Mui.Grid>
}
