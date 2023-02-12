open Home.Section
open Scroll
open ReactDOM

let menuItems = isLatestNewsRead =>
  if isLatestNewsRead {
    list{LatestNews, AboutUs, References, Contact}
  } else {
    list{AboutUs, References, Contact}
  }

let scrollToSection = sectionAnchor => {
  let anchor = querySelector(`#${sectionAnchor}`)
  anchor->Belt.Option.forEach(anchor =>
    anchor->scrollIntoView({behavior: #smooth, block: #start, inline: #start})
  )
}

let onClick = (~onSuccess=() => (), homeSection) => {
  switch homeSection {
  | LatestNews => Common.Constants.SectionAnchor.latestNews->scrollToSection
  | AboutUs => Js.Console.log("Scrolling to about us")
  | References => Js.Console.log("Scrolling to references")
  | Contact => Js.Console.log("Scrolling to contact")
  }
  onSuccess()
}
