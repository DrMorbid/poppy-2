module MenuItem = {
  type t =
    | Home
    | WhoWeAre
    | QAndA
    | References
    | Filmak
    | Contact

  let toLabel = page => {
    open Message.Menu

    switch page {
    | Home => home
    | WhoWeAre => whoWeAre
    | References => references
    | Filmak => filmak
    | Contact => contact
    | QAndA => qAndA
    }
  }
}

module Age = {
  type ageLimit = Years(int) | Months(int)
}
