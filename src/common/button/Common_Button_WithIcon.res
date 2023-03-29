open Mui
open ReactIntl
open ReactDOM

module Icon = Common_Icon

module Classes = {
  let iconGap = Style.make(~gridColumnGap="0.5rem", ())->Emotion.styleToClass
}

@react.component
let make = (~label, ~onClick) => {
  let intl = useIntl()

  <Button variant=#outlined onClick>
    <Grid container=true alignItems=#center className=Classes.iconGap>
      <Icon.MailOutline />
      {intl->Intl.formatMessage(label)->React.string}
    </Grid>
  </Button>
}
