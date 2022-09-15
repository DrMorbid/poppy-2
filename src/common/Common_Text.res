open Mui
open ReactIntl

@react.component
let make = (~header=?, ~paragraphs) => {
  let intl = useIntl()
  let classes = Common_Style.useStyles(.)

  <Grid container=true className={classes["paragraphGap"]}>
    {header->Belt.Option.mapWithDefault(React.null, header =>
      <Grid item=true xs=Grid.Xs.\"12">
        <Typography variant=#h4> {intl->Intl.formatMessage(header)->React.string} </Typography>
      </Grid>
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
