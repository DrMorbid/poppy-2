type t = LatestNews | AboutUs | References | Contact

let toLabel = page => {
  open Message.Menu

  switch page {
  | LatestNews => news
  | AboutUs => aboutUs
  | References => references
  | Contact => contact
  }
}
