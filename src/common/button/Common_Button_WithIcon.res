open Mui

module Icon = Common_Icon

module Classes = {
  let iconGap = Mui.Sx.obj({columnGap: String("0.5rem")})
}

@react.component
let make = (~label, ~onClick, ~large=false) => {
  let intl = ReactIntl.useIntl()

  <Button
    variant=Outlined
    size=?{large ? Some(Large) : None}
    onClick
    sx=?{large ? Some(Common_Style.largeButtonLabel) : None}>
    <Grid container=true sx=Classes.iconGap>
      <Icon.MailOutline />
      {intl->ReactIntl.Intl.formatMessage(label)->React.string}
    </Grid>
  </Button>
}
