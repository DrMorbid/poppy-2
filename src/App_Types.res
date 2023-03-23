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

  module TargetsMap = Belt.Id.MakeComparable({
    type t = t
    let cmp = (a, b) =>
      switch (a, b) {
      | (
        Home,
        WhoWeAre
        | QAndA
        | References
        | Contact
        | RegistrationsYoungest
        | RegistrationsMiddle
        | RegistrationsOldest
        | CurrentRegistrationDates,
      )
      | (
        WhoWeAre,
        QAndA
        | References
        | Contact
        | RegistrationsYoungest
        | RegistrationsMiddle
        | RegistrationsOldest
        | CurrentRegistrationDates,
      )
      | (
        QAndA,
        References
        | Contact
        | RegistrationsYoungest
        | RegistrationsMiddle
        | RegistrationsOldest
        | CurrentRegistrationDates,
      )
      | (
        References,
        Contact
        | RegistrationsYoungest
        | RegistrationsMiddle
        | RegistrationsOldest
        | CurrentRegistrationDates,
      )
      | (
        Contact,
        RegistrationsYoungest
        | RegistrationsMiddle
        | RegistrationsOldest
        | CurrentRegistrationDates,
      )
      | (
        RegistrationsYoungest,
        RegistrationsMiddle
        | RegistrationsOldest
        | CurrentRegistrationDates,
      )
      | (RegistrationsMiddle, RegistrationsOldest | CurrentRegistrationDates)
      | (RegistrationsOldest, CurrentRegistrationDates) => -1
      | (Home, Home)
      | (WhoWeAre, WhoWeAre)
      | (QAndA, QAndA)
      | (References, References)
      | (Contact, Contact)
      | (RegistrationsYoungest, RegistrationsYoungest)
      | (RegistrationsMiddle, RegistrationsMiddle)
      | (RegistrationsOldest, RegistrationsOldest)
      | (CurrentRegistrationDates, CurrentRegistrationDates) => 0
      | (
        CurrentRegistrationDates,
        RegistrationsOldest
        | RegistrationsMiddle
        | RegistrationsYoungest
        | Contact
        | Home
        | WhoWeAre
        | QAndA
        | References,
      )
      | (
        RegistrationsOldest,
        RegistrationsMiddle
        | RegistrationsYoungest
        | Contact
        | Home
        | WhoWeAre
        | QAndA
        | References,
      )
      | (
        RegistrationsMiddle,
        RegistrationsYoungest | Contact | Home | WhoWeAre | QAndA | References,
      )
      | (RegistrationsYoungest, Contact | Home | WhoWeAre | QAndA | References)
      | (Contact, Home | WhoWeAre | QAndA | References)
      | (References, Home | WhoWeAre | QAndA)
      | (QAndA, Home | WhoWeAre)
      | (WhoWeAre, Home) => 1
      }
  })

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
    | CurrentRegistrationDates => currentRegistrationDates
    }
  }
}
