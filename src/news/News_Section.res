@react.component
let make = (~header=Message.News.header, ~headerVariant=?, ~headerUppercase=?) => {
  <Common.Text header ?headerVariant ?headerUppercase body=Element(<News_Message />) />
}
