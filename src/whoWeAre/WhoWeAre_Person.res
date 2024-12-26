open Message.WhoWeAre
open Mui.Grid
open Common

module Photo = WhoWeAre_Photo

let getContact = (email): Text.fragmentParagraph => {
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
let make = (~photoSrc, ~name, ~description, ~email=?, ~allwaysFullWidth=false) => {
  <Mui.Grid container=true justifyContent=Center>
    <Mui.Grid item=true xs=Number(12)>
      <Mui.Grid container=true justifyContent=Center>
        <Mui.Grid item=true>
          <Photo src=photoSrc />
        </Mui.Grid>
      </Mui.Grid>
    </Mui.Grid>
    <Mui.Grid
      item=true xs=Number(12) md=Number(10) lg=Number(8) xl=Number(allwaysFullWidth ? 6 : 12)>
      <Text
        body={Fragments(
          list{
            {
              Text.content: list{
                Text({
                  content: name,
                  bold: true,
                }),
              },
              centered: true,
            },
            ...description->List.map((descriptionLine): Text.fragmentParagraph => {
              content: list{descriptionLine},
            }),
          }->List.concat(email->Option.mapOr(list{}, email => list{email->getContact})),
        )}
      />
    </Mui.Grid>
  </Mui.Grid>
}
