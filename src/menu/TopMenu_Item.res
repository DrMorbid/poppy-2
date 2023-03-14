open Scroll
open App_Types.MenuItem

let getMenuItems = url =>
  url->App_Router.isHomePage ? list{LatestNews, AboutUs, QAndA, References, Contact} : list{Home}

let scrollToSection = (scrollableRef: React.ref<Js.Nullable.t<Dom.element>>) =>
  scrollableRef.current
  ->Js.Nullable.toOption
  ->Belt.Option.forEach(ref => ref->scrollIntoView(makeScrollOptions()))

let onClick = (~onDrawerClose=?, ~menuItemTargets: App_Context.menuItemTargets, menuItem) => {
  let goToTarget = () =>
    menuItemTargets
    ->Belt.Map.get(menuItem)
    ->Belt.Option.forEach(menuItem =>
      switch menuItem {
      | ScrollableRef(scrollableRef) => scrollToSection(scrollableRef)
      | Page(page) => App_Router.goTo(page)
      }
    )

  switch onDrawerClose {
  | Some(onDrawerClose) => {
      onDrawerClose()
      Js.Global.setTimeout(() => goToTarget(), Common.Constants.drawerTransitionDuration)->ignore
    }

  | None => goToTarget()
  }
}