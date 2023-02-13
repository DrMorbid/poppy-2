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
  open Common.Constants.SectionAnchor

  switch homeSection {
  | LatestNews => latestNews->scrollToSection
  | AboutUs => aboutUs->scrollToSection
  | References => references->scrollToSection
  | Contact => contact->scrollToSection
  }
  onSuccess()
}
