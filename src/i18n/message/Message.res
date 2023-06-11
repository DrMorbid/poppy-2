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
let registrationsYoungest =
  @intl.description("Registrations - youngest kids")
  {
    id: "c9bb840c-4f73-4a84-9cb6-2cf39ad7f925",
    defaultMessage: "6 měs. - 17 měs.",
  }
let registrationsMiddle =
  @intl.description("Registrations - middle kids")
  {
    id: "aff491b0-4982-4a78-b94e-dc6f658b690a",
    defaultMessage: "18 měs. - 3 roky",
  }
let registrationsOldest =
  @intl.description("Registrations - oldest kids")
  {
    id: "9ae6d7cc-7db0-4d70-bff0-952bdefb1d8f",
    defaultMessage: "4 - 15 let",
  }

module Menu = Message_Menu
module Home = Message_Home
module News = Message_News
module WhoWeAre = Message_WhoWeAre
module Registrations = Message_Registrations
module References = Message_References
module Contact = Message_Contact
module QAndA = Message_QAndA
module EmailUs = Message_EmailUs
