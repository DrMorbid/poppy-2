open Scroll
open App_Types.MenuItem

let getMenuItems = pathname =>
  if pathname->App_Page.isHomePage {
    list{WhoWeAre, QAndA, References, Contact}
  } else if pathname->App_Page.isRegistrationsPage {
    list{
      Home,
      RegistrationsYoungest,
      RegistrationsMiddle,
      RegistrationsOldest,
      CurrentRegistrationDates,
    }
  } else {
    list{Home}
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

let pickMenuItemTargets = (~homeMenuItemTargets, ~registrationsMenuItemTargets, url) =>
  if url->App_Page.isHomePage {
    homeMenuItemTargets
  } else {
    registrationsMenuItemTargets
  }
