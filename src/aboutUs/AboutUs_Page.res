@react.component
let make = () => {
  <Common.Text
    header=Message.AboutUs.header
    paragraphs=list{
      Message.AboutUs.paragraph1,
      Message.AboutUs.paragraph2,
      Message.AboutUs.paragraph3,
      Message.AboutUs.paragraph4,
    }
  />
}
