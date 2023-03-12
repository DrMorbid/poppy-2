open Scroll
open App_Types

let menuItems = list{LatestNews, AboutUs, References, Contact}

let scrollToSection = (sectionTopRef: React.ref<Js.Nullable.t<Dom.element>>) =>
  sectionTopRef.current
  ->Js.Nullable.toOption
  ->Belt.Option.forEach(ref => ref->scrollIntoView(makeScrollOptions()))

let onClick = (~onDrawerClose=?, ~refsMap, homeSection) => {
  let scroll = () => refsMap->Belt.Map.get(homeSection)->Belt.Option.forEach(scrollToSection)

  switch onDrawerClose {
  | Some(onDrawerClose) => {
      onDrawerClose()
      Js.Global.setTimeout(() => scroll(), Common.Constants.drawerTransitionDuration)->ignore
    }

  | None => scroll()
  }
}
