module MenuItem = {
  type t = Home | LatestNews | AboutUs | QAndA | References | Contact

  module TargetsMap = Belt.Id.MakeComparable({
    type t = t
    let cmp = (a, b) =>
      switch (a, b) {
      | (Home, LatestNews | AboutUs | QAndA | References | Contact)
      | (LatestNews, AboutUs | QAndA | References | Contact)
      | (AboutUs, QAndA | References | Contact)
      | (QAndA, References | Contact)
      | (References, Contact) => -1
      | (Home, Home)
      | (LatestNews, LatestNews)
      | (AboutUs, AboutUs)
      | (QAndA, QAndA)
      | (References, References)
      | (Contact, Contact) => 0
      | (Contact, Home | LatestNews | AboutUs | QAndA | References)
      | (References, Home | LatestNews | AboutUs | QAndA)
      | (QAndA, Home | LatestNews | AboutUs)
      | (AboutUs, Home | LatestNews)
      | (LatestNews, Home) => 1
      }
  })

  let toLabel = page => {
    open Message.Menu

    switch page {
    | Home => home
    | LatestNews => news
    | AboutUs => aboutUs
    | References => references
    | Contact => contact
    | QAndA => qAndA
    }
  }
}
