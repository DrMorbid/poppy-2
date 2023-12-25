type fragmentContent = Message(ReactIntl.message) | String(string)

type fragment =
  | Text({content: fragmentContent, bold?: bool, color?: [#error], appendSpace?: bool})
  | Element(Jsx.element)

type fragmentParagraph = {content: list<fragment>, centered?: bool}

type listRowContent = Fragments(list<fragment>) | Message(ReactIntl.message)

type listRow = {content: listRowContent, bold?: bool}

type listParagraph = {
  title?: ReactIntl.message,
  list: list<listRow>,
}

type body =
  | Paragraphs(list<ReactIntl.message>)
  | Fragments(list<fragmentParagraph>)
  | Lists(list<listParagraph>)
  | Element(Jsx.element)

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

module Text = {
  @react.component
  let make = (~children, ~centered=?) => {
    <Mui.Grid
      item=true
      xs=Number(12)
      className={centered->Option.getOr(false) ? Common_Style.centeredText : ""}>
      children
    </Mui.Grid>
  }
}

module Fragment = {
  @react.component
  let make = (~fragments) => {
    fragments
    ->List.mapWithIndex((index, fragment) => {
      switch fragment {
      | Text(fragment) =>
        <Mui.Typography
          component={"span"->Mui.OverridableComponent.string}
          className={fragment.bold->Option.getOr(false) ? Common_Style.bold : ""}
          key={`fragment-${index->Int.toString}`}
          color=?{fragment.color
          ->Option.map(color => (color :> string))
          ->Option.map(color => Mui.System.Value.String(color))}>
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
}

@react.component
let make = (
  ~header=?,
  ~headerVariant: Mui.Typography.variant=H2,
  ~headerUppercase=false,
  ~afterHeader=?,
  ~body,
  ~centerAll=?,
  ~disableGutters=false,
) => {
  let intl = ReactIntl.useIntl()

  let getContainerClassname = () =>
    (disableGutters ? list{} : list{Common_Style.paragraphGap})
    ->List.concat(
      centerAll->Option.mapOr(list{}, centerAll =>
        centerAll ? list{Common_Style.centeredText} : list{}
      ),
    )
    ->List.reduce("", (result, className) => `${result} ${className}`)

  <Mui.Grid container=true className={getContainerClassname()}>
    {header->Option.mapOr(React.null, header =>
      <Mui.Grid item=true xs=Number(12) className={Common_Style.centeredText}>
        <Mui.Typography
          variant=headerVariant
          className=?{headerUppercase ? Some(Common_Style.uppercaseText) : None}>
          {intl->ReactIntl.Intl.formatMessage(header)->React.string}
        </Mui.Typography>
      </Mui.Grid>
    )}
    {afterHeader->Option.mapOr(React.null, afterHeader =>
      <Mui.Grid item=true xs=Number(12)> afterHeader </Mui.Grid>
    )}
    {switch body {
    | Paragraphs(paragraphs) =>
      paragraphs
      ->List.mapWithIndex((index, paragraph) =>
        <Text key={`paragraph-${index->Int.toString}`}>
          <Mui.Typography>
            {intl->ReactIntl.Intl.formatMessage(paragraph)->React.string}
          </Mui.Typography>
        </Text>
      )
      ->List.toArray
      ->React.array
    | Fragments(paragraphs) =>
      paragraphs
      ->List.mapWithIndex((index, fragments) =>
        <Text centered=?fragments.centered key={`paragraph-${index->Int.toString}`}>
          <Fragment fragments=fragments.content />
        </Text>
      )
      ->List.toArray
      ->React.array
    | Lists(paragraphs) =>
      paragraphs
      ->List.mapWithIndex((index, paragraph) =>
        <Mui.Grid container=true key={`paragraph-${index->Int.toString}`}>
          {paragraph.title->Option.mapOr(React.null, title =>
            <Text>
              <Mui.Typography>
                {intl->ReactIntl.Intl.formatMessage(title)->React.string}
              </Mui.Typography>
            </Text>
          )}
          <Mui.Grid item=true xs=Number(12)>
            <Mui.List>
              {paragraph.list
              ->List.mapWithIndex((index, row) =>
                <Mui.ListItem key={`list-row-${index->Int.toString}`}>
                  {switch row.content {
                  | Fragments(fragments) =>
                    <Mui.Grid container=true>
                      <Mui.Grid item=true xs=Number(12)>
                        <Fragment fragments />
                      </Mui.Grid>
                    </Mui.Grid>
                  | Message(message) =>
                    <Mui.ListItemText
                      primary={intl->ReactIntl.Intl.formatMessage(message)->React.string}
                      classes=?{row.bold->Option.getOr(false)
                        ? Some({primary: Common_Style.bold})
                        : None}
                    />
                  }}
                </Mui.ListItem>
              )
              ->List.toArray
              ->React.array}
            </Mui.List>
          </Mui.Grid>
        </Mui.Grid>
      )
      ->List.toArray
      ->React.array
    | Element(element) => <Text> element </Text>
    }}
  </Mui.Grid>
}
