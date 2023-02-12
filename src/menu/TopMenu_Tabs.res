open Mui
open ReactIntl
open TopMenu_Item
open Home.Section
open ReactDOM

let useStyles: Styles.useStyles<{
  "tabLabel": string,
}> = Styles.makeStylesWithTheme(theme => {
  let tabTypography = theme.typography.h5
  {
    "tabLabel": Style.make(
      ~fontFamily=?tabTypography.fontFamily,
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
  let ({activeMenuItem, _}: App_Context.state, _dispatch) = React.useContext(App_Context.Context.t)

  // TODO: This is wrong, we need to use the section we clicked
  <Tabs value={activeMenuItem->Any.make} variant=#fullWidth>
    {menuItems(isLatestNewsRead)
    ->Belt.List.map(section =>
      <Tab
        classes={Tab.Classes.make(~wrapper=classes["tabLabel"], ())}
        label={intl->Intl.formatMessage(section->toLabel)->React.string}
        value={section->Any.make}
        onClick={_ => section->onClick}
      />
    )
    ->Belt.List.toArray
    ->React.array}
  </Tabs>
}
