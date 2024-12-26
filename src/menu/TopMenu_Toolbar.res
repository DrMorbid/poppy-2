open TopMenu_Item

module Button = TopMenu_Toolbar_Button

@react.component
let make = () => {
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
      ->List.mapWithIndex((menuItem, index) =>
        <Mui.Grid item=true key={`menu-item-${index->Int.toString}`}>
          <Button
            label={menuItem->App_Types.MenuItem.toLabel}
            onClick={_ =>
              menuItem->onClick(
                ~menuItemTargets=pathname->pickMenuItemTargets(
                  ~homeMenuItemTargets,
                  ~registrationsMenuItemTargets,
                ),
                ~router,
              )}
            index
          />
        </Mui.Grid>
      )
      ->List.toArray
      ->React.array}
    </Mui.Grid>
  </Mui.Toolbar>
}
