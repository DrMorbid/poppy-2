open Message.News

@react.component
let make = () => {
  <Common.Text header body=Element(<News_Message />) />
}
