open Common_Text_Type

module FragmentContent = {
  let toString = (~intl, content: fragmentContent) =>
    switch content {
    | Message(message) => intl->ReactIntl.Intl.formatMessage(message)
    | String(string) => string
    }

  let addSuffix = (~appendSpace=?, ~index, ~fragmentsCount) =>
    index < fragmentsCount - 1 && appendSpace->Option.getOr(false) ? " " : ""

  @react.component
  let make = (~content, ~index, ~fragmentsCount, ~appendSpace=?) => {
    let intl = ReactIntl.useIntl()

    (content->toString(~intl) ++ addSuffix(~index, ~fragmentsCount, ~appendSpace?))->React.string
  }
}

@react.component
let make = (~fragments) => {
  fragments
  ->List.mapWithIndex((fragment, index) => {
    switch fragment {
    | Text(fragment) =>
      <Mui.Typography
        component={"span"->Mui.OverridableComponent.string}
        sx=?{fragment.bold->Option.getOr(false) ? Some(Common_Style.bold->Mui.Sx.obj) : None}
        key={`fragment-${index->Int.toString}`}
        color=?{fragment.color
        ->Option.map(color => (color :> string))
        ->Option.map(color => Mui.System.Value.String(color))}
      >
        <FragmentContent
          content=fragment.content
          index
          fragmentsCount={fragments->List.size}
          appendSpace=?fragment.appendSpace
        />
      </Mui.Typography>
    | Element(element) => element
    }
  })
  ->List.toArray
  ->React.array
}
