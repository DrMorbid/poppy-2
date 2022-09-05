open ReactIntl

@@intl.messages

let appName =
  @intl.description("The name of the application")
  {id: "1c7ff9c8-a7f2-40bf-a645-f7ac48cdfbd9", defaultMessage: "Poppy Casting"}

module Menu = {
  @@intl.messages

  let aboutUs =
    @intl.description("Top menu item - About us")
    {id: "0371f3b2-5b62-4c6b-baac-a3925b811458", defaultMessage: "O nás"}
  let registrations =
    @intl.description("Top menu item - Registrations")
    {id: "b54fd38e-5cab-4dc6-9db0-c3f2bc180395", defaultMessage: "Registrace"}
  let references =
    @intl.description("Top menu item - References")
    {id: "6bf7df3e-31ef-4204-863a-9cf963d73779", defaultMessage: "Reference"}
  let contact =
    @intl.description("Top menu item - Contact")
    {id: "6bf7df3e-31ef-4204-863a-9cf963d73779", defaultMessage: "Kontakt"}
}
