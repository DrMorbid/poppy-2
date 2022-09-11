open Mui
open ReactIntl
open ReactDOM

let useStyles: Styles.useStyles<{
  "container": string,
}> = Styles.makeStyles({
  "container": Style.make(~gridRowGap="1rem", ()),
})

@react.component
let make = (~header=?, ~paragraphs) => {
  let intl = useIntl()
  let classes = useStyles(.)

  <Grid container=true className={classes["container"]}>
    {header->Belt.Option.mapWithDefault(React.null, header =>
      <Grid item=true>
        <Typography variant=#h4> {intl->Intl.formatMessage(header)->React.string} </Typography>
      </Grid>
    )}
    {paragraphs
    ->Belt.List.map(paragraph =>
      <Grid item=true>
        <Typography> {intl->Intl.formatMessage(paragraph)->React.string} </Typography>
      </Grid>
    )
    ->Belt.List.toArray
    ->React.array}
  </Grid>
}
