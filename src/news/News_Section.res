open News_Message
open Message.News

@react.component
let make = () => {
  <Common.Text header body=Element(<Content displayDate=false />) />
}
