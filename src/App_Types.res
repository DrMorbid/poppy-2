module MenuItem = {
  type t = Home | LatestNews | WhoWeAre | QAndA | References | Contact

  module TargetsMap = Belt.Id.MakeComparable({
    type t = t
    let cmp = (a, b) =>
      switch (a, b) {
      | (Home, LatestNews | WhoWeAre | QAndA | References | Contact)
      | (LatestNews, WhoWeAre | QAndA | References | Contact)
      | (WhoWeAre, QAndA | References | Contact)
      | (QAndA, References | Contact)
      | (References, Contact) => -1
      | (Home, Home)
      | (LatestNews, LatestNews)
      | (WhoWeAre, WhoWeAre)
      | (QAndA, QAndA)
      | (References, References)
      | (Contact, Contact) => 0
      | (Contact, Home | LatestNews | WhoWeAre | QAndA | References)
      | (References, Home | LatestNews | WhoWeAre | QAndA)
      | (QAndA, Home | LatestNews | WhoWeAre)
      | (WhoWeAre, Home | LatestNews)
      | (LatestNews, Home) => 1
      }
  })

  let toLabel = page => {
    open Message.Menu

    switch page {
    | Home => home
    | LatestNews => news
    | WhoWeAre => whoWeAre
    | References => references
    | Contact => contact
    | QAndA => qAndA
    }
  }
}
