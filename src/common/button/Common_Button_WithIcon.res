open Mui
open ReactDOM

module Icon = Common_Icon

module Classes = {
  let iconGap = Style.make(~gridColumnGap="0.5rem !important", ())->Emotion.styleToClass
}

@react.component
let make = (~label, ~onClick) => {
  let intl = ReactIntl.useIntl()

  <Button variant=Outlined onClick>
    <Grid container=true className=Classes.iconGap>
      <Icon.MailOutline />
      {intl->ReactIntl.Intl.formatMessage(label)->React.string}
    </Grid>
  </Button>
}
