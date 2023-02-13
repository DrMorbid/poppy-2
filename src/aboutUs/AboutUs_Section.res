open Message.AboutUs

@react.component
let make = () => {
  <Common.Text header body=Paragraphs(list{paragraph1, paragraph2, paragraph3, paragraph4}) />
}
