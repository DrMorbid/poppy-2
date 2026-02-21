open Scroll
open App_Types.MenuItem

let getMenuItems = pathname => {
  if pathname->App_Page.isHomePage {
    list{WhoWeAre, QAndA, References, Filmak, Contact}
  } else {
    list{Home}
  }
}

let scrollToSection = (scrollableRef: React.ref<Nullable.t<Dom.element>>) =>
  scrollableRef.current
  ->Nullable.toOption
  ->Option.forEach(ref => ref->scrollIntoView(makeScrollOptions()))

let onClick = (
  ~onDrawerClose=?,
  ~menuItemTargets: App_Context.menuItemTargets,
  ~router,
  menuItem,
) => {
  let goToTarget = () =>
    menuItemTargets
    ->Map.get(menuItem)
    ->Option.forEach(menuItem =>
      switch menuItem {
      | ScrollableRef(scrollableRef) => scrollToSection(scrollableRef)
      | Page(page) => router->App_Page.goTo(page)
      | ExternalUrl(url) =>
        Webapi.Dom.window
        ->Webapi.Dom.Window.open_(~url, ~name="_blank", ~features="noreferrer", ())
        ->ignore
      }
    )

  switch onDrawerClose {
  | Some(onDrawerClose) => {
      onDrawerClose()
      setTimeout(() => goToTarget(), Common.Constants.drawerTransitionDuration)->ignore
    }

  | None => goToTarget()
  }
}
