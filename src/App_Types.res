module MenuItem = {
  type t = LatestNews | AboutUs | QAndA | References | Contact

  module TargetsMap = Belt.Id.MakeComparable({
    type t = t
    let cmp = (a, b) =>
      switch (a, b) {
      | (LatestNews, AboutUs | QAndA | References | Contact)
      | (AboutUs, QAndA | References | Contact)
      | (QAndA, References | Contact)
      | (References, Contact) => -1
      | (LatestNews, LatestNews)
      | (AboutUs, AboutUs)
      | (QAndA, QAndA)
      | (References, References)
      | (Contact, Contact) => 0
      | (Contact, LatestNews | AboutUs | QAndA | References)
      | (References, LatestNews | AboutUs | QAndA)
      | (QAndA, LatestNews | AboutUs)
      | (AboutUs, LatestNews) => 1
      }
  })

  let toLabel = page => {
    open Message.Menu

    switch page {
    | LatestNews => news
    | AboutUs => aboutUs
    | References => references
    | Contact => contact
    | QAndA => qAndA
    }
  }
}
