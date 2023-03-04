open Mui
open ReactIntl
open TopMenu_Item
open Home.Section
open ReactDOM

let useStyles: Styles.useStyles<{
  "label": string,
}> = Styles.makeStylesWithTheme(theme => {
  let tabTypography = theme.typography.h5
  {
    "label": Style.make(
      ~fontSize=?tabTypography.fontSize,
      ~fontWeight=?tabTypography.fontWeight,
      ~lineHeight=?tabTypography.lineHeight,
      (),
    ),
  }
})

@react.component
let make = (~isLatestNewsRead) => {
  let intl = useIntl()
  let classes = useStyles(.)

  <Toolbar>
    <Grid container=true justify=#"space-evenly">
      {menuItems(isLatestNewsRead)
      ->Belt.List.map(section =>
        <Grid item=true>
          <Button
            size=#large
            onClick={_ => section->onClick}
            classes={Button.Classes.make(~label=classes["label"], ())}>
            {intl->Intl.formatMessage(section->toLabel)->React.string}
          </Button>
        </Grid>
      )
      ->Belt.List.toArray
      ->React.array}
    </Grid>
  </Toolbar>
}
