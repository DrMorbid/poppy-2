open Common_Text_Type

module FragmentContent = {
  let toString = (~intl, content: fragmentContent) =>
    switch content {
    | Message(message) => intl->ReactIntl.Intl.formatMessage(message)
    | String(string) => string
    | Link({content}) => content
    }

  let addSuffix = (~appendSpace=?, ~index, ~fragmentsCount) =>
    index < fragmentsCount - 1 && appendSpace->Option.getOr(false) ? " " : ""

  @react.component
  let make = (~content, ~index, ~fragmentsCount, ~appendSpace=?) => {
    let intl = ReactIntl.useIntl()

    let text = content->toString(~intl) ++ addSuffix(~index, ~fragmentsCount, ~appendSpace?)

    switch content {
    | Link({href}) => <Mui.Link href> {text->React.string} </Mui.Link>
    | _ => text->React.string
    }
  }
}

let combineStyles = (~bold=false, ~italic=false) => {
  let bold = bold ? [Common_Style.bold->Mui.Sx.Array.obj] : []
  let italic = italic ? [Common_Style.italic->Mui.Sx.Array.obj] : []

  bold
  ->Array.concat(italic)
  ->Mui.Sx.array
}

@react.component
let make = (~fragments) => {
  fragments
  ->List.mapWithIndex((fragment, index) => {
    switch fragment {
    | Text(fragment) =>
      <Mui.Typography
        component={"span"->Mui.OverridableComponent.string}
        sx={combineStyles(~bold=?fragment.bold, ~italic=?fragment.italic)}
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
