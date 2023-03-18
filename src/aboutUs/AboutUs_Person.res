open Message.AboutUs
open Mui
open Mui.Grid
open Common.Text

module Photo = AboutUs_Photo

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
  <Grid container=true>
    <Grid item=true xs=Xs.\"12">
      <Grid container=true justify=#center>
        <Grid item=true>
          <Photo src=photoSrc />
        </Grid>
      </Grid>
    </Grid>
    <Grid item=true xs=Xs.\"12">
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
            ...description->Belt.List.map(descriptionLine => {
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
    </Grid>
  </Grid>
}
