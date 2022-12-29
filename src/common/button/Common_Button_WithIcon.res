open Mui
open ReactIntl
open ReactDOM

module Icon = Common_Icon

let useStyles: Styles.useStyles<{
  "iconGap": string,
}> = Styles.makeStyles({
  "iconGap": Style.make(~gridColumnGap="0.5rem", ()),
})

@react.component
let make = (~label) => {
  let intl = useIntl()
  let classes = useStyles(.)

  <Button variant=#outlined>
    <Grid container=true alignItems=#center className={classes["iconGap"]}>
      <Icon.MailOutline />
      {intl->Intl.formatMessage(label)->React.string}
    </Grid>
  </Button>
}
