open ReactIntl

@@intl.messages

let appName =
  @intl.description("The name of the application")
  {id: "1c7ff9c8-a7f2-40bf-a645-f7ac48cdfbd9", defaultMessage: "Poppy Casting"}

module Menu = {
  @@intl.messages

  let aboutUs =
    @intl.description("Top menu item - about us")
    {id: "0371f3b2-5b62-4c6b-baac-a3925b811458", defaultMessage: "O nás"}
}
