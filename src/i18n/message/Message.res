open ReactIntl

@@intl.messages

let appName =
  @intl.description("The name of the application")
  {id: "1c7ff9c8-a7f2-40bf-a645-f7ac48cdfbd9", defaultMessage: "Poppy Casting"}
let companyOwner =
  @intl.description("The company owner")
  {
    id: "588ddae1-8b2e-4141-b776-4cd9dfbc4447",
    defaultMessage: "Mgr. art. Martina Popperová",
  }
let registrationDatabasePerson =
  @intl.description("The Registration, database person")
  {
    id: "9713887e-eea1-4c46-8098-a5e56f5ccb40",
    defaultMessage: "Mgr. Hana Kittnarová",
  }

module Menu = Message_Menu
module Home = Message_Home
module News = Message_News
module AboutUs = Message_AboutUs
module Registrations = Message_Registrations
module References = Message_References
module Contact = Message_Contact
module QAndA = Message_QAndA
