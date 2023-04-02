open Message.WhoWeAre
open Mui.Grid
open Common.Text

module Photo = WhoWeAre_Photo

let getContact = (email): Common.Text.fragmentParagraph => {
  content: list{
    Text({
      content: Message(contact),
    }),
    Text({
      content: String(":"),
      appendSpace: true,
    }),
    Text({
      content: String(email),
    }),
  },
}

@react.component
let make = (~photoSrc, ~name, ~description, ~email) => {
  <Mui.Grid container=true>
    <Mui.Grid item=true xs=Xs.\"12">
      <Mui.Grid container=true justify=#center>
        <Mui.Grid item=true>
          <Photo src=photoSrc />
        </Mui.Grid>
      </Mui.Grid>
    </Mui.Grid>
    <Mui.Grid item=true xs=Xs.\"12">
      <Common.Text
        body={Fragments(
          list{
            {
              content: list{
                Text({
                  content: Message(name),
                  bold: true,
                }),
              },
              centered: true,
            },
            ...description->List.map((descriptionLine): fragmentParagraph => {
              content: list{
                Text({
                  content: Message(descriptionLine),
                }),
              },
            }),
            email->getContact,
          },
        )}
      />
    </Mui.Grid>
  </Mui.Grid>
}
