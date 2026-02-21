open ReactIntl
open TopMenu_Item

module Classes = {
  let list = Mui.Sx.obj({width: String("50vw")})
}

@react.component
let make = (~drawerOpen, ~onClose) => {
  let intl = useIntl()
  let pathname = Next.Navigation.usePathname()
  let router = Next.Navigation.useRouter()
  let ({homeMenuItemTargets, _}: App_Context.state, _) = React.useContext(App_Context.Context.t)

  <Mui.Drawer
    open_=drawerOpen
    transitionDuration={Time(Common.Constants.drawerTransitionDuration)}
    anchor=Right
    onClose={(_, _) => onClose()}
  >
    <Mui.List sx=Classes.list>
      {pathname
      ->getMenuItems
      ->List.mapWithIndex((section, index) =>
        <Mui.ListItemButton
          onClick={_ =>
            section->onClick(~onDrawerClose=onClose, ~menuItemTargets=homeMenuItemTargets, ~router)}
          key={`menu-item-${index->Int.toString}`}
        >
          <Mui.ListItemText
            primary={intl
            ->ReactIntl.Intl.formatMessage(section->App_Types.MenuItem.toLabel)
            ->React.string}
          />
        </Mui.ListItemButton>
      )
      ->List.toArray
      ->React.array}
    </Mui.List>
  </Mui.Drawer>
}
