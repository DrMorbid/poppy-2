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

module Classes = {
  let listItemIcon = [
    Mui.Sx.Array.func(theme =>
      Mui.Sx.Array.obj({
        color: String(theme.palette.text.primary),
        fontSize: String("0.5rem"),
      })
    ),
  ]->Mui.Sx.array
}

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
      sx=?{centered->Option.getOr(false) ? Some([Common_Style.centeredText]->Mui.Sx.array) : None}>
      children
    </Mui.Grid>
  }
}

module Fragment = {
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
    (disableGutters ? list{} : list{Common_Style.paragraphGap->Utils.Style.styleToSxArray})
    ->List.concat(
      centerAll->Option.mapOr(list{}, centerAll =>
        centerAll ? list{Common_Style.centeredText} : list{}
      ),
    )
    ->List.reduce([], (result, sx) => result->Array.concat([sx]))

  <Mui.Grid container=true sx={getContainerClassname()->Mui.Sx.array}>
    {header->Option.mapOr(React.null, header =>
      <Mui.Grid item=true xs=Number(12) sx={[Common_Style.centeredText]->Mui.Sx.array}>
        <Mui.Typography
          variant=headerVariant sx=?{headerUppercase ? Some(Common_Style.uppercaseText) : None}>
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
      ->List.mapWithIndex((paragraph, index) =>
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
      ->List.mapWithIndex((fragments, index) =>
        <Text centered=?fragments.centered key={`paragraph-${index->Int.toString}`}>
          <Fragment fragments=fragments.content />
        </Text>
      )
      ->List.toArray
      ->React.array
    | Lists(paragraphs) =>
      paragraphs
      ->List.mapWithIndex((paragraph, index) =>
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
              ->List.mapWithIndex((row, index) =>
                <Mui.ListItem key={`list-row-${index->Int.toString}`}>
                  {switch row.content {
                  | Fragments(fragments) =>
                    <>
                      <Mui.ListItemIcon sx=Classes.listItemIcon>
                        <Common_Icon.Circle fontSize="inherit" />
                      </Mui.ListItemIcon>
                      <Mui.Grid container=true>
                        <Mui.Grid item=true xs=Number(12)>
                          <Fragment fragments />
                        </Mui.Grid>
                      </Mui.Grid>
                    </>
                  | Message(message) =>
                    <>
                      <Mui.ListItemIcon sx=Classes.listItemIcon>
                        <Common_Icon.Circle fontSize="inherit" />
                      </Mui.ListItemIcon>
                      <Mui.ListItemText
                        primary={intl
                        ->ReactIntl.Intl.formatMessage(message)
                        ->React.string}
                        sx=?{row.bold->Option.getOr(false)
                          ? Some(
                              [("& .MuiListItemText-primary", Common_Style.bold)]
                              ->Dict.fromArray
                              ->Mui.Sx.dict,
                            )
                          : None}
                      />
                    </>
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
