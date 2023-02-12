open Mui
open ReactIntl

@react.component
let make = (~header=?, ~afterHeader=?, ~paragraphs, ~centerAll=?) => {
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
        <Typography variant=#h2> {intl->Intl.formatMessage(header)->React.string} </Typography>
      </Grid>
    )}
    {afterHeader->Belt.Option.mapWithDefault(React.null, afterHeader =>
      <Grid item=true xs=Grid.Xs.\"12"> afterHeader </Grid>
    )}
    {paragraphs
    ->Belt.List.mapWithIndex((index, paragraph) =>
      <Grid item=true xs=Grid.Xs.\"12" key={`paragraph-${index->Belt.Int.toString}`}>
        <Typography> {intl->Intl.formatMessage(paragraph)->React.string} </Typography>
      </Grid>
    )
    ->Belt.List.toArray
    ->React.array}
  </Grid>
}
