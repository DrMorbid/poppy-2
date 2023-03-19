module MenuItem = {
  type t = Home | WhoWeAre | QAndA | References | Contact

  module TargetsMap = Belt.Id.MakeComparable({
    type t = t
    let cmp = (a, b) =>
      switch (a, b) {
      | (Home, WhoWeAre | QAndA | References | Contact)
      | (WhoWeAre, QAndA | References | Contact)
      | (QAndA, References | Contact)
      | (References, Contact) => -1
      | (Home, Home)
      | (WhoWeAre, WhoWeAre)
      | (QAndA, QAndA)
      | (References, References)
      | (Contact, Contact) => 0
      | (Contact, Home | WhoWeAre | QAndA | References)
      | (References, Home | WhoWeAre | QAndA)
      | (QAndA, Home | WhoWeAre)
      | (WhoWeAre, Home) => 1
      }
  })

  let toLabel = page => {
    open Message.Menu

    switch page {
    | Home => home
    | WhoWeAre => whoWeAre
    | References => references
    | Contact => contact
    | QAndA => qAndA
    }
  }
}
