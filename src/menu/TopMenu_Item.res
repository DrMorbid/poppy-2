open Home.Section

let menuItems = isLatestNewsRead =>
  if isLatestNewsRead {
    list{LatestNews, AboutUs, References, Contact}
  } else {
    list{AboutUs, References, Contact}
  }

let onClick = (~onSuccess=() => (), homeSection) => {
  switch homeSection {
  | LatestNews => Js.Console.log("Scrolling to latest news")
  | AboutUs => Js.Console.log("Scrolling to about us")
  | References => Js.Console.log("Scrolling to references")
  | Contact => Js.Console.log("Scrolling to contact")
  }
  onSuccess()
}
