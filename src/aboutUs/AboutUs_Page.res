open Message.AboutUs

@react.component
let make = () => {
  <Common.Text header paragraphs=list{paragraph1, paragraph2, paragraph3, paragraph4} />
}
