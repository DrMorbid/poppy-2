open Mui
open ReactIntl
open TopMenu_Item
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
let make = () => {
  let intl = useIntl()
  let classes = useStyles(.)
  let url = RescriptReactRouter.useUrl()
  let ({menuItemTargets, _}: App_Context.state, _) = React.useContext(App_Context.Context.t)

  <Toolbar>
    <Grid container=true justify=#"space-evenly">
      {url
      ->getMenuItems
      ->Belt.List.mapWithIndex((index, menuItem) =>
        <Grid item=true key={`menu-item-${index->Belt.Int.toString}`}>
          <Button
            size=#large
            onClick={_ => menuItem->onClick(~menuItemTargets)}
            classes={Button.Classes.make(~label=classes["label"], ())}>
            {intl->Intl.formatMessage(menuItem->App_Types.MenuItem.toLabel)->React.string}
          </Button>
        </Grid>
      )
      ->Belt.List.toArray
      ->React.array}
    </Grid>
  </Toolbar>
}
