open Message
open Message.AboutUs
open Common.Constants
open Mui
open Mui.Grid

let getContact = (email): Common.Text.fragmentParagraph => list{
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
}

@react.component
let make = () => {
  let commonClasses = Common.Style.useStyles(.)

  <Common.Text
    header
    body={Element(
      <Grid container=true className={commonClasses["sectionGap"]}>
        <Grid item=true xs=Xs.\"12" xl=Xl.\"6">
          <Common.Text
            body={Fragments(list{
              list{
                Text({
                  content: Message(companyOwner),
                  bold: true,
                }),
              },
              list{
                Text({
                  content: Message(companyOwnerDescription1),
                }),
              },
              list{
                Text({
                  content: Message(companyOwnerDescription2),
                }),
              },
              list{
                Text({
                  content: Message(companyOwnerDescription3),
                }),
              },
              bossEmail->getContact,
            })}
          />
        </Grid>
        <Grid item=true xs=Xs.\"12" xl=Xl.\"6">
          <Common.Text
            body={Fragments(list{
              list{
                Text({
                  content: Message(registrationDatabasePerson),
                  bold: true,
                }),
              },
              list{
                Text({
                  content: Message(registrationDatabasePersonDescription1),
                }),
              },
              list{
                Text({
                  content: Message(registrationDatabasePersonDescription2),
                }),
              },
              registrationDatabasePersonEmail->getContact,
            })}
          />
        </Grid>
        <Grid item=true xs=Xs.\"12" xl=Xl.\"6">
          <Common.Text
            body={Fragments(list{
              list{
                Text({
                  content: Message(photographer),
                  bold: true,
                }),
              },
              list{
                Element(
                  <Link href=photographerWebsite key="element-fragment-1">
                    {photographerWebsite->React.string}
                  </Link>,
                ),
              },
              list{
                Text({
                  content: Message(photographer1),
                }),
              },
            })}
          />
        </Grid>
        <Grid item=true xs=Xs.\"12" xl=Xl.\"6">
          <Common.Text
            body={Fragments(list{
              list{
                Text({
                  content: Message(assistants),
                  bold: true,
                }),
              },
            })}
          />
        </Grid>
      </Grid>,
    )}
  />
}
