type homeSection = LatestNews | AboutUs | References | Contact

module MenuItemsTopRefsMap = Belt.Id.MakeComparable({
  type t = homeSection
  let cmp = (a, b) =>
    switch (a, b) {
    | (LatestNews, AboutUs | References | Contact)
    | (AboutUs, References | Contact)
    | (References, Contact) => -1
    | (LatestNews, LatestNews)
    | (AboutUs, AboutUs)
    | (References, References)
    | (Contact, Contact) => 0
    | (Contact, LatestNews | AboutUs | References)
    | (References, LatestNews | AboutUs)
    | (AboutUs, LatestNews) => 1
    }
})
