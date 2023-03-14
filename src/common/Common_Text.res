open Mui
open ReactIntl

type fragment = {
  content: ReactIntl.message,
  bold?: bool,
}

type fragmentParagraph = list<fragment>

type listParagraph = {
  title: ReactIntl.message,
  list: list<ReactIntl.message>,
}

type body =
  | Paragraphs(list<ReactIntl.message>)
  | Fragments(list<fragmentParagraph>)
  | Lists(list<listParagraph>)
  | Element(Jsx.element)

module Text = {
  @react.component
  let make = (~children) => {
    <Grid item=true xs=Grid.Xs.\"12"> children </Grid>
  }
}

@react.component
let make = (~header=?, ~headerVariant=#h2, ~afterHeader=?, ~body, ~centerAll=?) => {
  let intl = useIntl()
  let classes = Common_Style.useStyles(.)

  let getContainerClassname = () =>
    list{classes["paragraphGap"]}
    ->Belt.List.concat(
      centerAll->Belt.Option.mapWithDefault(list{}, centerAll =>
        centerAll ? list{classes["centeredText"]} : list{}
      ),
    )
    ->Belt.List.reduce("", (result, className) => `${result} ${className}`)

  <Grid container=true className={getContainerClassname()}>
    {header->Belt.Option.mapWithDefault(React.null, header =>
      <Grid item=true xs=Grid.Xs.\"12" className={classes["centeredText"]}>
        <Typography variant=headerVariant>
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
        <Text key={`paragraph-${index->Belt.Int.toString}`}>
          {fragments
          ->Belt.List.mapWithIndex((index, fragment) =>
            <Typography
              component={"span"->Typography.Component.string}
              className={fragment.bold->Belt.Option.getWithDefault(false) ? classes["bold"] : ""}
              key={`fragment-${index->Belt.Int.toString}`}>
              {(intl->Intl.formatMessage(fragment.content) ++ (
                  index < fragments->Belt.List.size - 1 ? " " : ""
                ))->React.string}
            </Typography>
          )
          ->Belt.List.toArray
          ->React.array}
        </Text>
      )
      ->Belt.List.toArray
      ->React.array
    | Lists(paragraphs) =>
      paragraphs
      ->Belt.List.mapWithIndex((index, {title, list}) =>
        <Grid container=true key={`paragraph-${index->Belt.Int.toString}`}>
          <Text>
            <Typography> {intl->Intl.formatMessage(title)->React.string} </Typography>
          </Text>
          <Grid item=true xs=Grid.Xs.\"12">
            <List>
              {list
              ->Belt.List.mapWithIndex((index, item) =>
                <ListItem key={`list-item-${index->Belt.Int.toString}`}>
                  <ListItemText primary={intl->Intl.formatMessage(item)->React.string} />
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
