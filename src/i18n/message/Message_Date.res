open ReactIntl

@@intl.messages

let dateTooLow =
  @intl.description("Date validation - date is too low")
  {
    id: "8acc5ad9-1872-4be3-b3d0-8378ff135ef9",
    defaultMessage: "Datum je příliš nízké.",
  }
let dateTooHigh =
  @intl.description("Date validation - date is too high")
  {
    id: "66832bdf-0a9d-40b4-ad12-922591b87198",
    defaultMessage: "Datum je příliš vysoké.",
  }
let dateMissing =
  @intl.description("Date validation - date is missing")
  {
    id: "cff318a3-7706-433c-bd4b-13d498f57474",
    defaultMessage: "Prosím, zadejte datum.",
  }
let dateInvalid =
  @intl.description("Date validation - date is invalid")
  {
    id: "11fc9b24-ab05-4c46-b04b-116bd45f5a5a",
    defaultMessage: "Prosím, zadejte platné datum.",
  }
