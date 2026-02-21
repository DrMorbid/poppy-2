open Message.WhoWeAre
open Mui.Grid
open Common

module Photo = WhoWeAre_Photo

@react.component
let make = (~photoSrc, ~name, ~description, ~email=?, ~tel=?, ~allwaysFullWidth=false) => {
  let intl = ReactIntl.useIntl()

  let getContact = (~email=?, ~tel=?): Text.Type.fragmentParagraph =>
    switch (email, tel) {
    | (None, None) => {content: list{}}
    | (Some(emailOrTel), None) | (None, Some(emailOrTel)) => {
        content: list{
          Text({
            content: Message(contact),
          }),
          Text({
            content: String(":"),
            appendSpace: true,
          }),
          Text({
            content: String(emailOrTel),
          }),
        },
      }
    | (Some(email), Some(tel)) => {
        content: list{
          Element(
            <Mui.Typography key="contact-line-0">
              {intl->ReactIntl.Intl.formatMessage(contact)->String.concat(":")->Jsx.string}
            </Mui.Typography>,
          ),
          Element(
            <Mui.Typography key="contact-line-1">
              {intl
              ->ReactIntl.Intl.formatMessage(contactEmail)
              ->String.concat(`: ${email}`)
              ->Jsx.string}
            </Mui.Typography>,
          ),
          Element(
            <Mui.Typography key="contact-line-2">
              {intl
              ->ReactIntl.Intl.formatMessage(contactTelephone)
              ->String.concat(`: ${tel}`)
              ->Jsx.string}
            </Mui.Typography>,
          ),
        },
      }
    }

  <Mui.Grid container=true justifyContent=Center>
    <Mui.Grid item=true xs=Number(12)>
      <Mui.Grid container=true justifyContent=Center>
        <Mui.Grid item=true>
          <Photo src=photoSrc />
        </Mui.Grid>
      </Mui.Grid>
    </Mui.Grid>
    <Mui.Grid
      item=true xs=Number(12) md=Number(10) lg=Number(8) xl=Number(allwaysFullWidth ? 6 : 12)
    >
      <Text
        body={Fragments(
          list{
            {
              Text.Type.content: list{
                Text({
                  content: name,
                  bold: true,
                }),
              },
              centered: true,
            },
            ...description->List.map((descriptionLine): Text.Type.fragmentParagraph => {
              content: list{descriptionLine},
            }),
          }->List.concat(list{getContact(~email?, ~tel?)}),
        )}
      />
    </Mui.Grid>
  </Mui.Grid>
}
