open Mui
open News_Message
open Message.News
open ReactIntl

@react.component
let make = () => {
  let intl = useIntl()
  let classes = Common_Style.useStyles(.)

  <Grid container=true className={classes["paragraphGap"]}>
    <Grid item=true>
      <Typography variant=#h1> {intl->Intl.formatMessage(header)->React.string} </Typography>
    </Grid>
    <Grid item=true>
      <Content displayDate=false />
    </Grid>
  </Grid>
}
