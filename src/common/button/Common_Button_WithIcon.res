open Mui
open ReactDOM

module Icon = Common_Icon

module Classes = {
  let iconGap = Style.make(~gridColumnGap="0.5rem", ())->Emotion.styleToClass
}

@react.component
let make = (~label, ~onClick) => {
  let intl = ReactIntl.useIntl()

  <Button variant=#outlined onClick>
    <Grid container=true alignItems=#center className=Classes.iconGap>
      <Icon.MailOutline />
      {intl->ReactIntl.Intl.formatMessage(label)->React.string}
    </Grid>
  </Button>
}
