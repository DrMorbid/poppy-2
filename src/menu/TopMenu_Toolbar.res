open ReactIntl
open TopMenu_Item

module Classes = {
  let label = Mui.Sx.obj({
    fontSize: String(App_Theme.Typography.h5.fontSize),
    fontWeight: String(App_Theme.Typography.h5.fontWeight),
    lineHeight: Number(1.334),
  })
}

@react.component
let make = () => {
  let intl = useIntl()
  let pathname = Next.Navigation.usePathname()
  let router = Next.Navigation.useRouter()
  let (
    {homeMenuItemTargets, registrationsMenuItemTargets, _}: App_Context.state,
    _,
  ) = React.useContext(App_Context.Context.t)

  <Mui.Toolbar disableGutters=true>
    <Mui.Grid container=true justifyContent=String("space-evenly") spacing=Int(1)>
      {pathname
      ->getMenuItems
      ->List.mapWithIndex((index, menuItem) =>
        <Mui.Grid item=true key={`menu-item-${index->Int.toString}`}>
          <Mui.Button
            size=Large
            variant=Outlined
            color=Secondary
            onClick={_ =>
              menuItem->onClick(
                ~menuItemTargets=pathname->pickMenuItemTargets(
                  ~homeMenuItemTargets,
                  ~registrationsMenuItemTargets,
                ),
                ~router,
              )}
            sx=Classes.label>
            {intl->ReactIntl.Intl.formatMessage(menuItem->App_Types.MenuItem.toLabel)->React.string}
          </Mui.Button>
        </Mui.Grid>
      )
      ->List.toArray
      ->React.array}
    </Mui.Grid>
  </Mui.Toolbar>
}
