module MenuItem = {
  type t =
    | Home
    | WhoWeAre
    | QAndA
    | References
    | Contact
    | RegistrationsYoungest
    | RegistrationsMiddle
    | RegistrationsOldest
    | CurrentRegistrationDates

  let toLabel = page => {
    open Message
    open Message.Menu

    switch page {
    | Home => home
    | WhoWeAre => whoWeAre
    | References => references
    | Contact => contact
    | QAndA => qAndA
    | RegistrationsYoungest => registrationsYoungest
    | RegistrationsMiddle => registrationsMiddle
    | RegistrationsOldest => registrationsOldest
    | CurrentRegistrationDates => currentDates
    }
  }
}

module Age = {
  type ageLimit = Years(int) | Months(int)
}
