open Mui
open Mui.Grid
open ReactIntl

type fragmentContent = Message(ReactIntl.message) | String(string)

type fragment =
  | Text({content: fragmentContent, bold?: bool, color?: Typography.color, appendSpace?: bool})
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
    | Message(message) => intl->Intl.formatMessage(message)
    | String(string) => string
    }

  let addSuffix = (~appendSpace=?, ~index, ~fragmentsCount) =>
    index < fragmentsCount - 1 && appendSpace->Belt.Option.getWithDefault(false) ? " " : ""

  @react.component
  let make = (~content, ~index, ~fragmentsCount, ~appendSpace=?) => {
    let intl = useIntl()

    (content->toString(~intl) ++ addSuffix(~index, ~fragmentsCount, ~appendSpace?))->React.string
  }
}

module Text = {
  @react.component
  let make = (~children, ~centered=?) => {
    <Grid
      item=true
      xs=Grid.Xs.\"12"
      className={centered->Belt.Option.getWithDefault(false) ? Common_Style.centeredText : ""}>
      children
    </Grid>
  }
}

module Fragment = {
  @react.component
  let make = (~fragments) => {
    fragments
    ->Belt.List.mapWithIndex((index, fragment) => {
      switch fragment {
      | Text(fragment) =>
        <Typography
          component={"span"->Typography.Component.string}
          className={fragment.bold->Belt.Option.getWithDefault(false) ? Common_Style.bold : ""}
          key={`fragment-${index->Belt.Int.toString}`}
          color=?fragment.color>
          <FragmentContent
            content=fragment.content
            index
            fragmentsCount={fragments->Belt.List.size}
            appendSpace=?fragment.appendSpace
          />
        </Typography>
      | Element(element) => element
      }
    })
    ->Belt.List.toArray
    ->React.array
  }
}

@react.component
let make = (
  ~header=?,
  ~headerVariant=#h2,
  ~headerUppercase=false,
  ~afterHeader=?,
  ~body,
  ~centerAll=?,
  ~disableGutters=false,
) => {
  let intl = useIntl()

  let getContainerClassname = () =>
    (disableGutters ? list{} : list{Common_Style.paragraphGap})
    ->Belt.List.concat(
      centerAll->Belt.Option.mapWithDefault(list{}, centerAll =>
        centerAll ? list{Common_Style.centeredText} : list{}
      ),
    )
    ->Belt.List.reduce("", (result, className) => `${result} ${className}`)

  <Grid container=true className={getContainerClassname()}>
    {header->Belt.Option.mapWithDefault(React.null, header =>
      <Grid item=true xs=Grid.Xs.\"12" className={Common_Style.centeredText}>
        <Typography
          variant=headerVariant
          className=?{headerUppercase ? Some(Common_Style.uppercaseText) : None}>
          {intl->Intl.formatMessage(header)->React.string}
        </Typography>
      </Grid>
    )}
    {afterHeader->Belt.Option.mapWithDefault(React.null, afterHeader =>
      <Grid item=true xs=Grid.Xs.\"12"> afterHeader </Grid>
    )}
    {switch body {
    | Paragraphs(paragraphs) =>
      paragraphs
      ->Belt.List.mapWithIndex((index, paragraph) =>
        <Text key={`paragraph-${index->Belt.Int.toString}`}>
          <Typography> {intl->Intl.formatMessage(paragraph)->React.string} </Typography>
        </Text>
      )
      ->Belt.List.toArray
      ->React.array
    | Fragments(paragraphs) =>
      paragraphs
      ->Belt.List.mapWithIndex((index, fragments) =>
        <Text centered=?fragments.centered key={`paragraph-${index->Belt.Int.toString}`}>
          <Fragment fragments=fragments.content />
        </Text>
      )
      ->Belt.List.toArray
      ->React.array
    | Lists(paragraphs) =>
      paragraphs
      ->Belt.List.mapWithIndex((index, paragraph) =>
        <Grid container=true key={`paragraph-${index->Belt.Int.toString}`}>
          {paragraph.title->Belt.Option.mapWithDefault(React.null, title =>
            <Text>
              <Typography> {intl->Intl.formatMessage(title)->React.string} </Typography>
            </Text>
          )}
          <Grid item=true xs=Grid.Xs.\"12">
            <List>
              {paragraph.list
              ->Belt.List.mapWithIndex((index, row) =>
                <ListItem key={`list-row-${index->Belt.Int.toString}`}>
                  {switch row.content {
                  | Fragments(fragments) =>
                    <Grid container=true>
                      <Grid item=true xs=Xs.\"12">
                        <Fragment fragments />
                      </Grid>
                    </Grid>
                  | Message(message) =>
                    <ListItemText
                      primary={intl->Intl.formatMessage(message)->React.string}
                      classes=?{row.bold->Belt.Option.getWithDefault(false)
                        ? Some(ListItemText.Classes.make(~primary=Common_Style.bold, ()))
                        : None}
                    />
                  }}
                </ListItem>
              )
              ->Belt.List.toArray
              ->React.array}
            </List>
          </Grid>
        </Grid>
      )
      ->Belt.List.toArray
      ->React.array
    | Element(element) => <Text> element </Text>
    }}
  </Grid>
}
